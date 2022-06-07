import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:motus/data/repositories/word_repository.dart';

import '../../../../data/entities/word.dart';

part 'game_state.dart';

// prépare la donnée pour l'envoyer à la vue
class GameCubit extends Cubit<WordState> {

  final WordRepository wordRepository;

  GameCubit({required this.wordRepository}) : super(WordLoadingState());

  Future fetchWord() async {
    emit(WordLoadingState());

    try {
      final list = await wordRepository.getFilteredWords();
      emit(WordLoadedState(list));
    } on Exception catch (exception) {
      emit(WordErrorState(exception.toString()));
    }

  }
}
