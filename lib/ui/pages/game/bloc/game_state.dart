part of 'game_cubit.dart';

@immutable
abstract class WordState extends Equatable {}

class WordLoadingState extends WordState {
  @override
  List<Object?> get props => [];
}

class WordLoadedState extends WordState {
  final List<Word> words;

  WordLoadedState(this.words);

  @override
  List<Word> get props => words;
}

class WordErrorState extends WordState {
  final String error;

  WordErrorState(this.error);

  @override
  List<Object?> get props => [error];
}