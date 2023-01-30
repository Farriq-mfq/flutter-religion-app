// To parse this JSON data, do
//
//     final doaModel = doaModelFromJson(jsonString);

import 'dart:convert';

List<DoaModel> doaModelFromJson(String str) =>
    List<DoaModel>.from(json.decode(str).map((x) => DoaModel.fromJson(x)));

String doaModelToJson(List<DoaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoaModel {
  DoaModel({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });

  String id;
  String doa;
  String ayat;
  String latin;
  String artinya;

  factory DoaModel.fromJson(Map<String, dynamic> json) => DoaModel(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        latin: json["latin"],
        artinya: json["artinya"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doa": doa,
        "ayat": ayat,
        "latin": latin,
        "artinya": artinya,
      };
}
