// To parse this JSON data, do
//
//     final doaSholat = doaSholatFromJson(jsonString);

import 'dart:convert';

List<DoaSholat> doaSholatFromJson(String str) =>
    List<DoaSholat>.from(json.decode(str).map((x) => DoaSholat.fromJson(x)));

String doaSholatToJson(List<DoaSholat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoaSholat {
  DoaSholat({
    required this.id,
    required this.name,
    required this.arabic,
    required this.latin,
    required this.terjemahan,
  });

  int id;
  String name;
  String arabic;
  String latin;
  String terjemahan;

  factory DoaSholat.fromJson(Map<String, dynamic> json) => DoaSholat(
        id: json["id"],
        name: json["name"],
        arabic: json["arabic"],
        latin: json["latin"],
        terjemahan: json["terjemahan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "arabic": arabic,
        "latin": latin,
        "terjemahan": terjemahan,
      };
}
