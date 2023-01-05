import 'dart:async';

import 'package:assigment_5/cubits/cubit/login_cubit.dart';
import 'package:assigment_5/page/category.dart';
import 'package:assigment_5/page/login.dart';
import 'package:assigment_5/page/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, GoRouterState state) {
            return const ThisLogin();
          },
        ),
        GoRoute(
            path: '/',
            name: 'home',
            builder: (context, GoRouterState state) {
              return const ThisCategory();
            },
            routes: [
              GoRoute(
                path: 'product_list/:category',
                name: 'product_list',
                builder: (context, GoRouterState state) {
                  return ThisProduct(
                    category: state.params['category']!,
                    asc: state.queryParams['sort'] == 'asc',
                    quantity: int.parse(state.queryParams['filter'] ?? '0'),
                  );
                },
              ),
            ]),
        // GoRoute(
        //   path: '/product_list',
        //   builder: (context, GoRouterState state) {
        //     return const ThisProduct();
        //   },
        // ),
      ],
      redirect: ((context, GoRouterState state) {
        // Check if user logged in.
        final bool loggedIn =
            loginCubit.state.status == AuthStatus.authenticated;
        // Check if user logging in.
        final bool logginIn = state.subloc == '/login';

        if (!loggedIn) {
          return logginIn ? null : '/login';
        }
        if (logginIn) {
          return '/';
        }
        return null;
      }),
      refreshListenable: GoRouterRefreshStream(loginCubit.stream));
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
