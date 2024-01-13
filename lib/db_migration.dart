import 'package:drift/internal/versioned_schema.dart' as i0;
import 'package:drift/drift.dart' as i1;
import 'package:drift/drift.dart'; // ignore_for_file: type=lint,unused_import

// GENERATED BY drift_dev, DO NOT MODIFY.
final class Schema2 extends i0.VersionedSchema {
  Schema2({required super.database}) : super(version: 2);
  @override
  late final List<i1.DatabaseSchemaEntity> entities = [
    typeTable,
    taskTable,
    attendantTable,
  ];
  late final Shape0 typeTable = Shape0(
      source: i0.VersionedTable(
        entityName: 'type_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [],
        columns: [
          _column_0,
          _column_1,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape1 taskTable = Shape1(
      source: i0.VersionedTable(
        entityName: 'task_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [],
        columns: [
          _column_0,
          _column_2,
          _column_3,
          _column_4,
          _column_5,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape2 attendantTable = Shape2(
      source: i0.VersionedTable(
        entityName: 'attendant_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [],
        columns: [
          _column_0,
          _column_6,
          _column_7,
          _column_8,
        ],
        attachedDatabase: database,
      ),
      alias: null);
}

class Shape0 extends i0.VersionedTable {
  Shape0({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<int> get id =>
      columnsByName['id']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<String> get typeName =>
      columnsByName['type_name']! as i1.GeneratedColumn<String>;
}

i1.GeneratedColumn<int> _column_0(String aliasedName) =>
    i1.GeneratedColumn<int>('id', aliasedName, false,
        hasAutoIncrement: true,
        type: i1.DriftSqlType.int,
        defaultConstraints:
            i1.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
i1.GeneratedColumn<String> _column_1(String aliasedName) =>
    i1.GeneratedColumn<String>('type_name', aliasedName, false,
        type: i1.DriftSqlType.string);

class Shape1 extends i0.VersionedTable {
  Shape1({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<int> get id =>
      columnsByName['id']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<String> get title =>
      columnsByName['title']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<int> get type =>
      columnsByName['type']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<String> get location =>
      columnsByName['location']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<bool> get isUrgent =>
      columnsByName['is_urgent']! as i1.GeneratedColumn<bool>;
}

i1.GeneratedColumn<String> _column_2(String aliasedName) =>
    i1.GeneratedColumn<String>('title', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<int> _column_3(String aliasedName) =>
    i1.GeneratedColumn<int>('type', aliasedName, false,
        type: i1.DriftSqlType.int,
        defaultConstraints: i1.GeneratedColumn.constraintIsAlways(
            'REFERENCES type_table (id)'));
i1.GeneratedColumn<String> _column_4(String aliasedName) =>
    i1.GeneratedColumn<String>('location', aliasedName, true,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<bool> _column_5(String aliasedName) =>
    i1.GeneratedColumn<bool>('is_urgent', aliasedName, false,
        type: i1.DriftSqlType.bool,
        defaultConstraints: i1.GeneratedColumn.constraintIsAlways(
            'CHECK ("is_urgent" IN (0, 1))'),
        defaultValue: const Constant(false));

class Shape2 extends i0.VersionedTable {
  Shape2({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<int> get id =>
      columnsByName['id']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<String> get name =>
      columnsByName['name']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<int> get taskId =>
      columnsByName['task_id']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<String> get department =>
      columnsByName['department']! as i1.GeneratedColumn<String>;
}

i1.GeneratedColumn<String> _column_6(String aliasedName) =>
    i1.GeneratedColumn<String>('name', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<int> _column_7(String aliasedName) =>
    i1.GeneratedColumn<int>('task_id', aliasedName, false,
        type: i1.DriftSqlType.int,
        defaultConstraints: i1.GeneratedColumn.constraintIsAlways(
            'REFERENCES task_table (id)'));
i1.GeneratedColumn<String> _column_8(String aliasedName) =>
    i1.GeneratedColumn<String>('department', aliasedName, true,
        type: i1.DriftSqlType.string);
i0.MigrationStepWithVersion migrationSteps({
  required Future<void> Function(i1.Migrator m, Schema2 schema) from1To2,
}) {
  return (currentVersion, database) async {
    switch (currentVersion) {
      case 1:
        final schema = Schema2(database: database);
        final migrator = i1.Migrator(database, schema);
        await from1To2(migrator, schema);
        return 2;
      default:
        throw ArgumentError.value('Unknown migration from $currentVersion');
    }
  };
}

i1.OnUpgrade stepByStep({
  required Future<void> Function(i1.Migrator m, Schema2 schema) from1To2,
}) =>
    i0.VersionedSchema.stepByStepHelper(
        step: migrationSteps(
      from1To2: from1To2,
    ));
