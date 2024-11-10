part of 'play_bloc.dart';

sealed class PlayEvent {
  const PlayEvent();
}

final class PickWord$PlayEvent extends PlayEvent {
  final int level;

  const PickWord$PlayEvent(this.level);
}

final class FoundLetter$PlayEvent extends PlayEvent {
  final String letter;
  final BuildContext context;

  const FoundLetter$PlayEvent({
    required this.letter,
    required this.context,
  });
}

final class ErrorLetter$PlayEvent extends PlayEvent {
  final String letter;
  final BuildContext context;

  const ErrorLetter$PlayEvent({
    required this.letter,
    required this.context,
  });
}
