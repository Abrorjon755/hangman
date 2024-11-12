import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/style/app_sounds.dart';
import '../../../../common/utils/context_extension.dart';
import '../../../../common/widgets/my_pattern_box.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key, required this.toggleVolume});

  final Future<void> Function() toggleVolume;

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  late ValueNotifier<bool> soundOn;
  late ValueNotifier<bool> musicOn;

  @override
  void initState() {
    super.initState();
    soundOn =
        ValueNotifier(context.dependency.shp.getBool(Constants.volume) ?? true);
    musicOn = ValueNotifier(true);
  }

  @override
  void dispose() {
    soundOn.dispose();
    musicOn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * .7,
        ),
        child: MyPatternBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 30),
                    const SizedBox(),
                    Text(
                      context.lang.settings,
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: context.colors.onSecondaryContainer,
                      ),
                    ),
                    PopScope(
                      canPop: false,
                      child: ZoomTapAnimation(
                        onTap: () {
                          context.dependency.player
                              .play(AssetSource(AppSounds.tap));
                          context.pop();
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: context.colors.primary,
                          child: FaIcon(
                            FontAwesomeIcons.x,
                            size: 15,
                            color: context.colors.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: context.colors.primary,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        child: FaIcon(
                          FontAwesomeIcons.volumeLow,
                          size: 30,
                          color: context.colors.primary,
                        ),
                      ),
                      Text(
                        context.lang.sound,
                        style: context.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      ValueListenableBuilder(
                        valueListenable: soundOn,
                        builder:
                            (BuildContext context, bool value, Widget? child) =>
                                Switch(
                          value: value,
                          onChanged: (v) async {
                            soundOn.value = v;
                            widget.toggleVolume();
                          },
                          overlayColor: WidgetStateColor.transparent,
                          thumbColor: WidgetStatePropertyAll(
                              context.colors.onSecondary),
                          inactiveThumbColor: context.colors.outline,
                          activeColor: context.colors.primary,
                          trackColor:
                              WidgetStatePropertyAll(context.colors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        child: FaIcon(
                          FontAwesomeIcons.music,
                          size: 30,
                          color: context.colors.primary,
                        ),
                      ),
                      Text(
                        context.lang.music,
                        style: context.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      ValueListenableBuilder(
                        valueListenable: musicOn,
                        builder:
                            (BuildContext context, bool value, Widget? child) =>
                                Switch(
                          value: value,
                          onChanged: (v) {
                            context.dependency.player
                                .play(AssetSource(AppSounds.tap));
                            musicOn.value = v;
                          },
                          overlayColor: WidgetStateColor.transparent,
                          thumbColor: WidgetStatePropertyAll(
                              context.colors.onSecondary),
                          inactiveThumbColor: context.colors.outline,
                          activeColor: context.colors.primary,
                          trackColor:
                              WidgetStatePropertyAll(context.colors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
