// To parse this JSON data, do
//
//     final tahlilModel = tahlilModelFromJson(jsonString);

import 'dart:convert';

TahlilModel tahlilModelFromJson(String str) =>
    TahlilModel.fromJson(json.decode(str));

String tahlilModelToJson(TahlilModel data) => json.encode(data.toJson());

class TahlilModel {
  TahlilModel({
    required this.id,
    required this.title,
    required this.arabic,
    required this.translation,
  });

  int id;
  String title;
  String arabic;
  String translation;

  factory TahlilModel.fromJson(Map<String, dynamic> json) => TahlilModel(
        id: json["id"],
        title: json["title"],
        arabic: json["arabic"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "arabic": arabic,
        "translation": translation,
      };
}
