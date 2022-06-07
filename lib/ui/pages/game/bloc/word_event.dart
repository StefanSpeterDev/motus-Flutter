import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/entities/word.dart';

@immutable
abstract class WordEvent extends Equatable{
  const WordEvent();
}

class LoadWordEvent extends WordEvent{
  @override
  List<Word> get props => [];
}