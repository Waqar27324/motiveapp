// ignore_for_file: public_member_api_docs, sort_constructors_first
// The state of our StateNotifier should be immutable.
// We could also use packages like Freezed to help with the implementation.
import 'dart:convert';

import 'package:flutter/material.dart';

// @immutable
// class Todo {
//    Todo({required this.id, required this.description,  this.completed = false});
//   // All properties should be `final` on our class.
//    final String? id;
//    final String? description;
//   final  bool completed = false;
//   // Since Todo is immutable, we implement a method that allows cloning the
//   // Todo with slightly different content.
//   // Todo copyWith({String? id, String? description, bool? completed}) {
//   //   return Todo(
//   //     id: id ?? this.id,
//   //     description: description ?? this.description,
//   //     completed: completed ?? this.completed,
//   //   );
//   // }
//   Todo.fromMap(Map<String, dynamic> data) {
//     id = data["id"];
//     description = data["description"];
//     completed = data["completed"];
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'description': description,
//       'completed': completed
//     };
//   }
// }

@immutable
class Todo {
  final String id;
  final String? description;
  final bool completed;

  const Todo({
    required this.id,
    this.description,
    required this.completed,
  });

  Todo copyWith({
    String? id,
    String? description,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      description:
          map['description'] != null ? map['description'] as String : null,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Todo(id: $id, description: $description, completed: $completed)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        other.completed == completed;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ completed.hashCode;
}
