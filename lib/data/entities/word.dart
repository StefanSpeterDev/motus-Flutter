import 'dart:convert';

Word WordFromJson(String str) => Word.fromJson(json.decode(str));

class Word {
  Word({
   required this.name,
   required this.wordId,
   required this.id
  });

  String name;
  String wordId;
  String id;

  factory Word.fromJson(Map<String, dynamic> json) => Word(
      name: json["WordName"],
      wordId: json["WordId"],
      id: json['Id'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "wordId" : wordId,
    "id": id,
  };

}