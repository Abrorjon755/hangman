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

  const FoundLetter$PlayEvent(this.letter);
}

final class ErrorLetter$PlayEvent extends PlayEvent {
  final String letter;

  const ErrorLetter$PlayEvent(this.letter);
}
