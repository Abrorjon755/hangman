import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/screen/home_screen.dart';
import '../../features/loading/screen/loading_screen.dart';
import '../../features/play/bloc/play_bloc.dart';
import '../../features/play/screen/play_screen.dart';
import '../constants/constants.dart';
import '../utils/context_extension.dart';

class AppRouter {
  const AppRouter._();

  static const String home = "/home";
  static const String loading = "/loading";
  static const String play = "/play";
}

final navigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigationKey,
  initialLocation: AppRouter.home,
  routes: [
    GoRoute(
      path: AppRouter.loading,
      name: AppRouter.loading,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: LoadingScreen(route: state.extra as String),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
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
        child: BlocProvider(
          create: (BuildContext context) => PlayBloc()
            ..add(
              PickWord$PlayEvent(
                int.parse(
                    context.dependency.shp.getString(Constants.level) ?? "1"),
              ),
            ),
          child: const PlayScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
  ],
);
