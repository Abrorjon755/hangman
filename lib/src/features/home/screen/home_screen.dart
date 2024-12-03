import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/router/app_router.dart';
import '../../../common/utils/context_extension.dart';
import '../../../common/widgets/my_pattern_box.dart';
import 'widgets/settings_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ValueNotifier<bool> isVolumeOn;

  Future<void> toggleVolume() async {
    final bool volume =
        context.dependency.shp.getBool(Constants.volume) ?? true;
    isVolumeOn.value = !volume;
    await context.dependency.shp.setBool(Constants.volume, !volume);
  }

  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      isVolumeOn = ValueNotifier(
          context.dependency.shp.getBool(Constants.volume) ?? true);
    }
  }

  @override
  void dispose() {
    isVolumeOn.dispose();
    super.dispose();
  }

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
                    ZoomTapAnimation(
                      child: MyPatternBox(
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
                    ),
                  ],
                ),
                Column(
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              SettingsDialog(toggleVolume: toggleVolume),
                        );
                      },
                      child: MyPatternBox(
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
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                      valueListenable: isVolumeOn,
                      builder:
                          (BuildContext context, bool value, Widget? child) =>
                              ZoomTapAnimation(
                        onTap: toggleVolume,
                        child: MyPatternBox(
                          child: SizedBox.square(
                            dimension: 45,
                            child: Center(
                              child: FaIcon(
                                value
                                    ? FontAwesomeIcons.volumeHigh
                                    : FontAwesomeIcons.volumeXmark,
                                color: context.colors.onSecondaryContainer,
                                size: 25,
                              ),
                            ),
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
            ZoomTapAnimation(
              onTap: () {
                context.go(AppRouter.loading, extra: AppRouter.play);
              },
              child: DecoratedBox(
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
          ],
        ),
      ),
    );
  }
}
