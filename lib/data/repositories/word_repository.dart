import 'package:http/http.dart' as http;
import '../entities/word.dart';
import '../dataSources/remote/word_api.dart';

class WordRepository {

  final WordApi _wordApi = WordApi();

  Future<List<Word>> getFilteredWords() async {
    List<Word> list = await _wordApi.getAll();
    return list.where((word) => word.name.length >= 5).toList();
  }

}