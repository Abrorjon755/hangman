import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/context_extension.dart';
import '../../../../common/widgets/my_pattern_box.dart';
import '../../bloc/play_bloc.dart';

class MyLetter extends StatelessWidget {
  const MyLetter({
    super.key,
    required this.letter,
  });

  final String letter;

  @override
  Widget build(BuildContext context) {
    return MyPatternBox(
      child: InkWell(
        onTap: () {
          if (context.read<PlayBloc>().state.word.contains(letter)) {
            context.read<PlayBloc>().add(
                  FoundLetter$PlayEvent(letter),
                );
          } else {
            context.read<PlayBloc>().add(
                  ErrorLetter$PlayEvent(letter),
                );
          }
        },
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            letter,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
