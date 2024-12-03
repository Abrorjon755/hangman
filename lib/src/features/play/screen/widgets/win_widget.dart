import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/router/app_router.dart';
import '../../../../common/service/level_words.dart';
import '../../../../common/utils/context_extension.dart';
import '../../../../common/widgets/my_pattern_box.dart';

class WinWidget extends StatelessWidget {
  const WinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: MyPatternBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              Text(
                context.lang.win,
                style: context.textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: context.colors.primary,
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colors.secondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${context.lang.level}:",
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colors.onPrimary,
                          ),
                        ),
                        Text(
                          (int.parse(context.dependency.shp
                                          .getString(Constants.level) ??
                                      '1') -
                                  1)
                              .toString()
                              .padLeft(2, "0"),
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colors.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colors.secondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${context.lang.progress}:",
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colors.onPrimary,
                          ),
                        ),
                        Text(
                          "${((int.parse(context.dependency.shp.getString(Constants.level) ?? "1") - 1) / wordModels.length * 100).toStringAsFixed(2)}%",
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colors.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ZoomTapAnimation(
                          onTap: () {
                            context.go(AppRouter.loading,
                                extra: AppRouter.home);
                          },
                          child: MyPatternBox(
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.house,
                                color: context.colors.primary,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ZoomTapAnimation(
                          onTap: () {
                            context.go(AppRouter.loading,
                                extra: AppRouter.play);
                          },
                          child: MyPatternBox(
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.arrowRight,
                                color: context.colors.primary,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
