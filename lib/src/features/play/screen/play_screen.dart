import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../common/constants/constants.dart';
import '../../../common/style/app_lotties.dart';
import '../../../common/utils/context_extension.dart';
import '../../../common/widgets/my_pattern_box.dart';
import '../../home/screen/widgets/settings_dialog.dart';
import '../bloc/play_bloc.dart';
import 'widgets/hangman.dart';
import 'widgets/lose_widget.dart';
import 'widgets/my_custom_keyboard.dart';
import 'widgets/win_widget.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  void showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => SettingsDialog(
        toggleVolume: () async {
          final bool volume =
              context.dependency.shp.getBool(Constants.volume) ?? true;
          await context.dependency.shp.setBool(Constants.volume, !volume);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primaryContainer,
      body: BlocBuilder<PlayBloc, PlayState>(
        builder: (context, state) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                      '1')
                                  .padLeft(2, "0"),
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colors.onSecondaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ZoomTapAnimation(
                    onTap: showSettingsDialog,
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
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.outline,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: context.colors.onSurface,
                    width: 5,
                  ),
                ),
              ),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    children: [
                      CustomPaint(
                        size: constraints.biggest,
                        painter: Hangman(
                          context: context,
                          errorCount: state.errorWords.length,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 39),
                          state.errorWords.isNotEmpty
                              ? Center(
                                  child: SizedBox.square(
                                    dimension:
                                        constraints.biggest.height / 2 - 7,
                                    child: state.errorWords.length >= 5
                                        ? Padding(
                                            padding: const EdgeInsets.all(28.0),
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: context
                                                    .colors.secondaryFixed,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                              ),
                                              child: Lottie.asset(
                                                AppLotties.dead,
                                                repeat: false,
                                              ),
                                            ),
                                          )
                                        : Lottie.asset(AppLotties.happy),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 110),
              child: Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < state.shownWord.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  color: context.colors.primary,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
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
                                  ]),
                              child: SizedBox(
                                width: 32,
                                child: Center(
                                  child: Text(
                                    state.shownWord[i],
                                    style: context.textTheme.headlineLarge
                                        ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: context.colors.errorContainer,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const MyPatternBox(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                child: SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            state.isWin
                ? const WinWidget()
                : state.errorWords.length >= 5
                    ? LoseWidget(category: state.category)
                    : Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: MyCustomKeyboard(
                                trueWords: state.trueWords,
                                errorWords: state.errorWords,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(child: SizedBox()),
                                  Expanded(
                                    flex: 2,
                                    child: ZoomTapAnimation(
                                      child: MyPatternBox(
                                        child: SizedBox(
                                          height: 50,
                                          child: Center(
                                            child: Text(
                                              state.category,
                                              style: context
                                                  .textTheme.titleLarge
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
