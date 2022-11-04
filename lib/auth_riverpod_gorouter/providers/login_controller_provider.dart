import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:motiveapp/auth_riverpod_gorouter/providers/states/login_states.dart';
import 'package:motiveapp/auth_riverpod_gorouter/repository/auth_repository.dart';
import 'package:motiveapp/models/todo_model.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  // List<String> ids= [];

  void login(String email, String password, context) async {
    state = const LoginStateLoading();

    try {
      await ref.read(authRepositoryProvider).login(email, password);
      var todoModel = Todo(
          id: email.toString(),
          description: password.toString(),
          completed: false);
      state = LoginStateSuccess(todoModel, [todoModel, todoModel]);
      if (state is LoginStateSuccess) {
        var i = state as LoginStateSuccess;
        print("haha ${i.todo?.completed}");
        // print(state as LoginStateSuccess);
      }
      GoRouter.of(context).push('/');
      // print("stateeee => " + state.todo.toString());
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  void doubleTheList() {
    if (state is LoginStateSuccess) {
      var states = state as LoginStateSuccess;
      var todoModel = Todo(
          id: states.todo?.id ?? '',
          description: states.todo?.description ?? '',
          completed: false);
      state = states.copyWith(todo: todoModel, todoList: [
        todoModel,
        todoModel,
        todoModel,
        todoModel,
      ]);
    }
  }

  void goBackToPreviousRoute(context) {
    if (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    } else {
      state = const LoginStateInitial();
    }
    // state = const LoginStateInitial();
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
