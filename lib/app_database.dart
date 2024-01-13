import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'tables.dart';
import 'models.dart';

part 'app_database.g.dart';

/// Provide data with riverpod
final databaseProvider = Provider<AppDatabase>((ref) {
  AppDatabase database = AppDatabase();

  ref.onDispose(() => database.close());

  return database;
});

@DriftDatabase(tables: [TaskTable, TypeTable, AttendantTable])

/// Put your tables inside [tables] list
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// This is our db version. We need this for migration
  @override
  int get schemaVersion => 1;

  /// We will handle migration proccess here
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        /// Create all tables
        m.createAll();

        /// Insert some data when the application is run for the first time
        await into(typeTable).insert(
          TypeTableCompanion.insert(typeName: 'Subtask'),
        );
        await into(typeTable).insert(
          TypeTableCompanion.insert(typeName: 'Feature'),
        );
        await into(typeTable).insert(
          TypeTableCompanion.insert(typeName: 'Bug'),
        );
      },
      beforeOpen: (details) async {
        /// Enable foreign_keys again
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<List<TaskModel>> getAllTasks() async {
    final query = select(taskTable).join([
      /// Join taskTable with typeTable with typeTable id
      innerJoin(
        typeTable,
        taskTable.type.equalsExp(typeTable.id),
      ),

      /// Join taskTable with attendantTable with taskTable id
      innerJoin(
        attendantTable,
        attendantTable.taskId.equalsExp(taskTable.id),
      ),
    ]);

    /// Order our result depending on id
    query.orderBy([OrderingTerm.desc(taskTable.id)]);

    /// Select statement with join returns return Future of List<TypedResult>
    /// Each [TypedResult] represents a row from which data can be read.
    /// It contains a rawData getter to obtain the raw columns.
    /// But more importantly, the [readTable] method can be used to read a data class from a table.
    final queryResult = await query.get();

    final groupedData = <TaskModel, List<AttendantModel>>{};

    /// Parsing result
    for (var row in queryResult) {
      /// [readTable] method can be used to read a data class from a table.
      final task = row.readTable(taskTable);
      final type = row.readTable(typeTable);
      final attendant = row.readTable(attendantTable);

      final taskModel = TaskModel(
        id: task.id,
        title: task.title,
        type: TypeModel(id: type.id, typeName: type.typeName),
        attendant: const [],
      );

      /// For each entry (row) that is included in a task, put it in the map of items.
      final attendantList = groupedData.putIfAbsent(taskModel, () => []);

      /// Include an attendant in the [groupedData] associated with the respective task.
      attendantList.add(AttendantModel(id: attendant.id, name: attendant.name));
    }

    /// Merge the map of tasks with the map of entries
    return groupedData.entries
        .map((e) => e.key.copyWith(attendant: e.value))
        .toList();
  }

  Future<int> insertTask(String taskTitle, int typeId) async {
    return transaction<int>(() async {
      /// Insert new task to db
      int newTaskId = await into(taskTable).insert(
        TaskTableCompanion.insert(title: taskTitle, type: typeId),
      );

      /// Insert random mock attendants
      /// Assign [newTaskId] to these new attendants
      await into(attendantTable).insert(
        AttendantTableCompanion.insert(
          name: attendantMock.getRandomElement(),
          taskId: newTaskId,
        ),
      );
      await into(attendantTable).insert(
        AttendantTableCompanion.insert(
          name: attendantMock.getRandomElement(),
          taskId: newTaskId,
        ),
      );

      return newTaskId;
    });
  }

  Future<void> deleteTask(int taskId) async {
    /// Before deleting a specific task, we need to first delete the related attendants.
    await (delete(attendantTable)..where((tbl) => tbl.taskId.equals(taskId)))
        .go();
    await (delete(taskTable)..where((tbl) => tbl.id.equals(taskId))).go();
  }

  Future<List<TypeModel>> getAllTypes() async {
    return (await select(typeTable).get())
        .map((e) => TypeModel(id: e.id, typeName: e.typeName))
        .toList();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();

    /// You can replace [db.sqlite] with anything you want
    /// Ex: cat.sqlite, darthVader.sqlite, todoDB.sqlite
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
