// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TypeTableTable extends TypeTable
    with TableInfo<$TypeTableTable, TypeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TypeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeNameMeta =
      const VerificationMeta('typeName');
  @override
  late final GeneratedColumn<String> typeName = GeneratedColumn<String>(
      'type_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, typeName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'type_table';
  @override
  VerificationContext validateIntegrity(Insertable<TypeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type_name')) {
      context.handle(_typeNameMeta,
          typeName.isAcceptableOrUnknown(data['type_name']!, _typeNameMeta));
    } else if (isInserting) {
      context.missing(_typeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TypeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TypeTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      typeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_name'])!,
    );
  }

  @override
  $TypeTableTable createAlias(String alias) {
    return $TypeTableTable(attachedDatabase, alias);
  }
}

class TypeTableData extends DataClass implements Insertable<TypeTableData> {
  final int id;
  final String typeName;
  const TypeTableData({required this.id, required this.typeName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type_name'] = Variable<String>(typeName);
    return map;
  }

  TypeTableCompanion toCompanion(bool nullToAbsent) {
    return TypeTableCompanion(
      id: Value(id),
      typeName: Value(typeName),
    );
  }

  factory TypeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TypeTableData(
      id: serializer.fromJson<int>(json['id']),
      typeName: serializer.fromJson<String>(json['typeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'typeName': serializer.toJson<String>(typeName),
    };
  }

  TypeTableData copyWith({int? id, String? typeName}) => TypeTableData(
        id: id ?? this.id,
        typeName: typeName ?? this.typeName,
      );
  @override
  String toString() {
    return (StringBuffer('TypeTableData(')
          ..write('id: $id, ')
          ..write('typeName: $typeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, typeName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TypeTableData &&
          other.id == this.id &&
          other.typeName == this.typeName);
}

class TypeTableCompanion extends UpdateCompanion<TypeTableData> {
  final Value<int> id;
  final Value<String> typeName;
  const TypeTableCompanion({
    this.id = const Value.absent(),
    this.typeName = const Value.absent(),
  });
  TypeTableCompanion.insert({
    this.id = const Value.absent(),
    required String typeName,
  }) : typeName = Value(typeName);
  static Insertable<TypeTableData> custom({
    Expression<int>? id,
    Expression<String>? typeName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (typeName != null) 'type_name': typeName,
    });
  }

  TypeTableCompanion copyWith({Value<int>? id, Value<String>? typeName}) {
    return TypeTableCompanion(
      id: id ?? this.id,
      typeName: typeName ?? this.typeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (typeName.present) {
      map['type_name'] = Variable<String>(typeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TypeTableCompanion(')
          ..write('id: $id, ')
          ..write('typeName: $typeName')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES type_table (id)'));
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isUrgentMeta =
      const VerificationMeta('isUrgent');
  @override
  late final GeneratedColumn<bool> isUrgent = GeneratedColumn<bool>(
      'is_urgent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_urgent" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, title, type, location, isUrgent];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_table';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('is_urgent')) {
      context.handle(_isUrgentMeta,
          isUrgent.isAcceptableOrUnknown(data['is_urgent']!, _isUrgentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      isUrgent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_urgent'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  /// v1 columns
  final int id;
  final String title;
  final int type;

  /// New colums for v2
  final String? location;
  final bool isUrgent;
  const TaskTableData(
      {required this.id,
      required this.title,
      required this.type,
      this.location,
      required this.isUrgent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<int>(type);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['is_urgent'] = Variable<bool>(isUrgent);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      isUrgent: Value(isUrgent),
    );
  }

  factory TaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<int>(json['type']),
      location: serializer.fromJson<String?>(json['location']),
      isUrgent: serializer.fromJson<bool>(json['isUrgent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<int>(type),
      'location': serializer.toJson<String?>(location),
      'isUrgent': serializer.toJson<bool>(isUrgent),
    };
  }

  TaskTableData copyWith(
          {int? id,
          String? title,
          int? type,
          Value<String?> location = const Value.absent(),
          bool? isUrgent}) =>
      TaskTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
        location: location.present ? location.value : this.location,
        isUrgent: isUrgent ?? this.isUrgent,
      );
  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('location: $location, ')
          ..write('isUrgent: $isUrgent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, type, location, isUrgent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.location == this.location &&
          other.isUrgent == this.isUrgent);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> type;
  final Value<String?> location;
  final Value<bool> isUrgent;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.location = const Value.absent(),
    this.isUrgent = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int type,
    this.location = const Value.absent(),
    this.isUrgent = const Value.absent(),
  })  : title = Value(title),
        type = Value(type);
  static Insertable<TaskTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? type,
    Expression<String>? location,
    Expression<bool>? isUrgent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (location != null) 'location': location,
      if (isUrgent != null) 'is_urgent': isUrgent,
    });
  }

  TaskTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int>? type,
      Value<String?>? location,
      Value<bool>? isUrgent}) {
    return TaskTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      location: location ?? this.location,
      isUrgent: isUrgent ?? this.isUrgent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (isUrgent.present) {
      map['is_urgent'] = Variable<bool>(isUrgent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('location: $location, ')
          ..write('isUrgent: $isUrgent')
          ..write(')'))
        .toString();
  }
}

class $AttendantTableTable extends AttendantTable
    with TableInfo<$AttendantTableTable, AttendantTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendantTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES task_table (id)'));
  static const VerificationMeta _departmentMeta =
      const VerificationMeta('department');
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
      'department', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, taskId, department];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendant_table';
  @override
  VerificationContext validateIntegrity(Insertable<AttendantTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('department')) {
      context.handle(
          _departmentMeta,
          department.isAcceptableOrUnknown(
              data['department']!, _departmentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendantTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendantTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      department: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}department']),
    );
  }

  @override
  $AttendantTableTable createAlias(String alias) {
    return $AttendantTableTable(attachedDatabase, alias);
  }
}

class AttendantTableData extends DataClass
    implements Insertable<AttendantTableData> {
  /// v1 columns
  final int id;
  final String name;
  final int taskId;

  /// New colum for v2
  final String? department;
  const AttendantTableData(
      {required this.id,
      required this.name,
      required this.taskId,
      this.department});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['task_id'] = Variable<int>(taskId);
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    return map;
  }

  AttendantTableCompanion toCompanion(bool nullToAbsent) {
    return AttendantTableCompanion(
      id: Value(id),
      name: Value(name),
      taskId: Value(taskId),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
    );
  }

  factory AttendantTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendantTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      taskId: serializer.fromJson<int>(json['taskId']),
      department: serializer.fromJson<String?>(json['department']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'taskId': serializer.toJson<int>(taskId),
      'department': serializer.toJson<String?>(department),
    };
  }

  AttendantTableData copyWith(
          {int? id,
          String? name,
          int? taskId,
          Value<String?> department = const Value.absent()}) =>
      AttendantTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        taskId: taskId ?? this.taskId,
        department: department.present ? department.value : this.department,
      );
  @override
  String toString() {
    return (StringBuffer('AttendantTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('taskId: $taskId, ')
          ..write('department: $department')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, taskId, department);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendantTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.taskId == this.taskId &&
          other.department == this.department);
}

class AttendantTableCompanion extends UpdateCompanion<AttendantTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> taskId;
  final Value<String?> department;
  const AttendantTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.taskId = const Value.absent(),
    this.department = const Value.absent(),
  });
  AttendantTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int taskId,
    this.department = const Value.absent(),
  })  : name = Value(name),
        taskId = Value(taskId);
  static Insertable<AttendantTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? taskId,
    Expression<String>? department,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (taskId != null) 'task_id': taskId,
      if (department != null) 'department': department,
    });
  }

  AttendantTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? taskId,
      Value<String?>? department}) {
    return AttendantTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      taskId: taskId ?? this.taskId,
      department: department ?? this.department,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendantTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('taskId: $taskId, ')
          ..write('department: $department')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TypeTableTable typeTable = $TypeTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $AttendantTableTable attendantTable = $AttendantTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [typeTable, taskTable, attendantTable];
}
