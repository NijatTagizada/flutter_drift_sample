import 'dart:math';

import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final int id;
  final String title;
  final TypeModel type;
  final List<AttendantModel> attendant;

  const TaskModel({
    required this.id,
    required this.title,
    required this.type,
    required this.attendant,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    TypeModel? type,
    List<AttendantModel>? attendant,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      attendant: attendant ?? this.attendant,
    );
  }

  @override
  List<Object> get props => [id, title, type, attendant];
}

class AttendantModel extends Equatable {
  final int id;
  final String name;

  const AttendantModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  @override
  String toString() => name;
}

class TypeModel extends Equatable {
  final int id;
  final String typeName;

  const TypeModel({
    required this.id,
    required this.typeName,
  });

  @override
  List<Object> get props => [id, typeName];
}

List<String> attendantMock = [
  "Riley",
  "Gilbert",
  "Jorge",
  "Dan",
  "Brian",
  "Roberto",
  "Ramon",
  "Miles",
  "Liam",
  "Nathaniel",
  "Ethan",
  "Lewis",
  "Milton",
  "Alexis",
  "Adrian",
  "Kingston",
  "Douglas",
  "Gerald",
  "Joey",
  "Johnny",
  "Charlie",
  "Scott",
  "Martin",
  "Tristin",
  "Troy",
  "Tommy",
  "Rick",
  "Victor",
  "Jessie",
];

extension GetRandomData<T> on Iterable<T> {
  T getRandomElement() {
    return elementAt(Random().nextInt(length - 1));
  }
}
