import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../common/utils/context_extension.dart';
import '../../../../common/widgets/my_pattern_box.dart';
import '../../bloc/play_bloc.dart';

class MyLetter extends StatelessWidget {
  const MyLetter({
    super.key,
    required this.letter,
    required this.errorWords,
    required this.trueWords,
  });

  final String letter;
  final List<String> trueWords;
  final List<String> errorWords;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        if (context.read<PlayBloc>().state.word.contains(letter)) {
          context.read<PlayBloc>().add(
                FoundLetter$PlayEvent(
                  letter: letter,
                  context: context,
                ),
              );
        } else {
          context.read<PlayBloc>().add(
                ErrorLetter$PlayEvent(
                  letter: letter,
                  context: context,
                ),
              );
        }
      },
      child: MyPatternBox(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            letter,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: trueWords.contains(letter)
                  ? Colors.green
                  : errorWords.contains(letter)
                      ? Colors.red
                      : context.colors.onSecondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
