import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/constants.dart';
import '../../../common/router/app_router.dart';
import '../../../common/utils/context_extension.dart';
import '../../../common/widgets/my_pattern_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    MyPatternBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Text(
                          context.lang.level +
                              (context.dependency.shp
                                      .getString(Constants.level) ??
                                  '01'),
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colors.onSecondaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MyPatternBox(
                      child: SizedBox.square(
                        dimension: 45,
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.gear,
                            color: context.colors.onSecondaryContainer,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyPatternBox(
                      child: SizedBox.square(
                        dimension: 45,
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.volumeHigh,
                            color: context.colors.onSecondaryContainer,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 100),
            Text(
              context.lang.hangman,
              style: context.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colors.onPrimary,
              ),
            ),
            const SizedBox(height: 100),
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.primaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 10,
                    blurRadius: 50,
                    color: context.colors.outline,
                  ),
                  BoxShadow(
                    spreadRadius: 5,
                    blurRadius: 25,
                    color: context.colors.primary,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () => context.push(AppRouter.play),
                child: SizedBox.square(
                  dimension: 100,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: context.colors.onSecondaryContainer,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                MyPatternBox(
                  child: SizedBox.square(
                    dimension: 50,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.bars,
                        color: context.colors.onSecondaryContainer,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
