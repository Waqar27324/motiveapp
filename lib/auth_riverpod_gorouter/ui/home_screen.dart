import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:motiveapp/auth_riverpod_gorouter/providers/login_controller_provider.dart';
import 'package:motiveapp/auth_riverpod_gorouter/providers/states/login_states.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(loginControllerProvider);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('We are at home'),
          if (state is LoginStateSuccess)
            for (var item in state.todoList!) Text('${item.id}'),
          // state.todoList.map((e) => Text('${e.id}')),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push('/thirdscreen');
            },
            child: Text('GoTo next Screen'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(loginControllerProvider.notifier)
                  .goBackToPreviousRoute(context);
            },
            child: Text('Go Back'),
          )
        ],
      )),
    );
  }
}
