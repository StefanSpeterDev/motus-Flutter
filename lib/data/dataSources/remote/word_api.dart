import 'dart:convert';
import '../../entities/word.dart';
import 'package:http/http.dart' as http;

class WordApi {

  final String _baseUrl = "https://frenchwordsapi.herokuapp.com/api";

  List<Word> allWord(String str) =>
      List<Word>.from(
        json.decode(str).map((x) => Word.fromJson(x)));

  Future<List<Word>> getAll() async {
    var url = Uri.parse('$_baseUrl/Word');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      return allWord(response.body);
    }else {
      throw Exception("Failed to load words");
    }
  }

}