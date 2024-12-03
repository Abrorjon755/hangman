import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../common/style/app_lotties.dart';
import '../../../common/utils/context_extension.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    super.key,
    required this.route,
  });

  final String route;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void go(BuildContext context) async {
    await Future.delayed(
      const Duration(milliseconds: 1650),
    );
    if (context.mounted) {
      context.go(widget.route);
    }
  }

  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: Lottie.asset(
          AppLotties.loading,
        ),
      ),
    );
  }
}
