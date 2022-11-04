import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:motiveapp/auth_riverpod_gorouter/providers/login_controller_provider.dart';
import 'package:motiveapp/auth_riverpod_gorouter/providers/states/login_states.dart';

class ThirdScreen extends ConsumerWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(loginControllerProvider);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('We are at 3rd Screen'),
          if (state is LoginStateSuccess)
            for (var item in state.todoList!)
              Text(
                '${item.id ?? 00}',
                style: TextStyle(color: Colors.red),
              ),
          // state.todoList.map((e) => Text('${e.id}')),
          TextButton(
            onPressed: () {
              ref.read(loginControllerProvider.notifier).doubleTheList();
            },
            child: Text('double the array items'),
          ),
          TextButton(
            onPressed: () {
              // GoRouter.of(context).navigator?.pop(context);
              GoRouter.of(context).pop();
              // ref
              //     .read(loginControllerProvider.notifier)
              //     .goBackToPreviousRoute(context);
            },
            child: Text('Go Back'),
          )
        ],
      )),
    );
  }
}
