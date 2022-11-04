import 'package:equatable/equatable.dart';
import 'package:motiveapp/models/todo_model.dart';

class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();
  @override
  List<Object> get props => [];
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
  @override
  List<Object> get props => [];
}

class LoginStateSuccess extends LoginState {
  final Todo? todo;
  final List<Todo>? todoList;
  const LoginStateSuccess(this.todo, this.todoList);

  LoginStateSuccess copyWith({Todo? todo, List<Todo>? todoList}) {
    return LoginStateSuccess(todo ?? this.todo, todoList ?? this.todoList);
  }

  @override
  List<Object> get props => [];
}

class LoginStateError extends LoginState {
  final String error;
  const LoginStateError(this.error);
  @override
  List<Object> get props => [error];
}
