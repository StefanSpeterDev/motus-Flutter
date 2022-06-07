import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motus/data/repositories/word_repository.dart';
import 'package:motus/ui/pages/game/bloc/game_cubit.dart';
class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WordRepository(),
      child: BlocProvider(
        create: (context) => GameCubit(wordRepository: RepositoryProvider.of<WordRepository>(context))..fetchWord(),
        child: BlocConsumer<GameCubit, WordState>(
          listener: (context, state) {
            if(state == WordLoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Goals successfully refreshed")),
              );
            } else if (state == WordLoadedState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state}')),);
            }
          },
          builder: (context, state) {
            if(state is WordLoadedState) {
              String test = state.words[0].name;
              return Center(child: Text(test));
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
