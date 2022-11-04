import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:motiveapp/auth_riverpod_gorouter/providers/login_controller_provider.dart';
import 'package:motiveapp/auth_riverpod_gorouter/providers/states/login_states.dart';
import 'package:motiveapp/auth_riverpod_gorouter/ui/home_screen.dart';
import 'package:motiveapp/auth_riverpod_gorouter/ui/login_screen.dart';
import 'package:motiveapp/auth_riverpod_gorouter/ui/thried_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      // redirect: router._redirectLogic,
      initialLocation: '/login',
      routes: [
        GoRoute(
          //  name: 'login',
          builder: (context, state) => const LoginScreen(),
          path: '/login',
        ),
        GoRoute(
            //  name: 'home',
            builder: (context, state) => const HomeScreen(),
            path: '/',
            routes: [
              GoRoute(
                // name: 'thirdscreen',
                builder: (context, state) => const ThirdScreen(),
                path: 'thirdscreen',
              ),
            ]),
      ]);
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<LoginState>(
      loginControllerProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(GoRouterState state) {
    final loginState = _ref.read(loginControllerProvider);
    final areWeLoggingIn = state.location == '/login';
    if (loginState is LoginStateInitial) {
      return areWeLoggingIn ? null : '/login';
    }
    if (loginState is LoginStateLoading) {
      return null;
    }

    if (areWeLoggingIn) return '/';

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          //  name: 'login',
          builder: (context, state) => const LoginScreen(),
          path: '/login',
        ),
        GoRoute(
          //  name: 'home',
          builder: (context, state) => const HomeScreen(),
          path: '/',
        ),
        GoRoute(
          // name: 'thirdscreen',
          builder: (context, state) => const ThirdScreen(),
          path: '/thirdscreen',
        ),
      ];
}
