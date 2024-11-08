import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/screen/home_screen.dart';
import '../../features/play/screen/play_screen.dart';

class AppRouter {
  const AppRouter._();

  static const String home = "/home";
  static const String play = "/play";
}

final navigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigationKey,
  initialLocation: AppRouter.home,
  routes: [
    GoRoute(
      path: AppRouter.home,
      name: AppRouter.home,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRouter.play,
      name: AppRouter.play,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PlayScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
              opacity: animation,
              child: child,
            ),
      ),
    ),
  ],
);
