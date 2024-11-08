import 'package:flutter/material.dart';

import '../style/app_images.dart';
import '../utils/context_extension.dart';

class MyPatternBox extends StatelessWidget {
  const MyPatternBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            AppImages.pattern,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 10,
            color: context.colors.outline,
          ),
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 5,
            color: context.colors.primary,
          ),
        ],
      ),
      child: child,
    );
  }
}
