part of 'play_bloc.dart';

class PlayState extends Equatable {
  final Status status;
  final String category;
  final String word;
  final String shownWord;
  final List<String> trueWords;
  final List<String> errorWords;

  const PlayState({
    this.status = Status.initial,
    this.category = '',
    this.word = '',
    this.shownWord = '',
    this.trueWords = const <String>[],
    this.errorWords = const <String>[],
  });

  @override
  List<Object?> get props => [
        status,
        category,
        word,
        shownWord,
        trueWords,
        errorWords,
      ];

  PlayState copyWith({
    final Status? status,
    final String? category,
    final String? word,
    final String? shownWord,
    final List<String>? trueWords,
    final List<String>? errorWords,
  }) =>
      PlayState(
        status: status ?? this.status,
        category: category ?? this.category,
        word: word ?? this.word,
        shownWord: shownWord ?? this.shownWord,
        trueWords: trueWords ?? this.trueWords,
        errorWords: errorWords ?? this.errorWords,
      );
}
