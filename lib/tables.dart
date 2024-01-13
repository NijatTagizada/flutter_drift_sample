import 'package:drift/drift.dart';

class TaskTable extends Table {
  /// v1 columns
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get type => integer().references(TypeTable, #id)();

  /// New colums for v2
  TextColumn get location => text().nullable()();
  BoolColumn get isUrgent => boolean().withDefault(const Constant(false))();
}

class AttendantTable extends Table {
  /// v1 columns
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get taskId => integer().references(TaskTable, #id)();

  /// New colum for v2
  TextColumn get department => text().nullable()();
}

class TypeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get typeName => text()();
}
