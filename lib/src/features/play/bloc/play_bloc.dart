import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/models/word_model.dart';
import '../../../common/service/level_words.dart';
import '../../../common/utils/status_enum.dart';

part 'play_event.dart';

part 'play_state.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  PlayBloc() : super(const PlayState()) {
    on<PlayEvent>(
      (event, emit) => switch (event) {
        PickWord$PlayEvent _ => _pickWord(event, emit),
        FoundLetter$PlayEvent _ => _foundLetter(event, emit),
        ErrorLetter$PlayEvent _ => _errorLetter(event, emit),
      },
    );
  }

  void _pickWord(PickWord$PlayEvent event, Emitter<PlayState> emit) {
    emit(state.copyWith(status: Status.loading));
    if (wordModels.length > event.level) {
      final WordModel chosen = wordModels[event.level];
      emit(
        state.copyWith(
            status: Status.success,
            word: chosen.word,
            category: chosen.category,
            shownWord: '_' * chosen.word.length),
      );
    } else {
      emit(
        state.copyWith(
          status: Status.error,
          word: '',
          category: "Game end",
        ),
      );
    }
  }

  void _foundLetter(FoundLetter$PlayEvent event, Emitter<PlayState> emit) {
    emit(state.copyWith(status: Status.loading));
    String shownWord = state.shownWord;
    List<String> splited = shownWord.split("");
    for (int i = 0; i < state.word.length; i++) {
      if (state.word[i] == event.letter) {
        splited[i] = event.letter;
      }
    }
    List<String> trueWords = state.trueWords.toList();
    trueWords.add(event.letter);
    emit(state.copyWith(
      status: Status.success,
      shownWord: splited.join(),
      trueWords: trueWords,
    ));
  }

  void _errorLetter(ErrorLetter$PlayEvent event, Emitter<PlayState> emit) {
    emit(state.copyWith(status: Status.loading));
    List<String> errorWords = state.errorWords.toList();
    errorWords.add(event.letter);
    emit(state.copyWith(
      status: Status.success,
      errorWords: errorWords,
    ));
  }
}
