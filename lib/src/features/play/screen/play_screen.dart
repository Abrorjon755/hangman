import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../common/constants/constants.dart';
import '../../../common/style/app_lotties.dart';
import '../../../common/utils/context_extension.dart';
import '../../../common/widgets/my_pattern_box.dart';
import 'widgets/hangman.dart';
import 'widgets/my_custom_keyboard.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primaryContainer,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
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
                      child: InkWell(
                        onTap: () => context.pop(),
                        child: SizedBox.square(
                          dimension: 45,
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.pause,
                              color: context.colors.onSecondaryContainer,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      painter: Hangman(context: context),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 39),
                        Center(
                          child: SizedBox.square(
                            dimension: constraints.biggest.height / 2 - 8,
                            child: Lottie.asset(AppLotties.happy),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: MyPatternBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 6,
                            ),
                            child: SizedBox(),
                          ),
                        ),
                      ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 24.0,
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: MyCustomKeyboard(),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 2,
                        child: MyPatternBox(
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "Country",
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
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
    );
  }
}