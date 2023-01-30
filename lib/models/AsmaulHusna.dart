// To parse this JSON data, do
//
//     final asmaulHusna = asmaulHusnaFromJson(jsonString);

import 'dart:convert';

List<AsmaulHusna> asmaulHusnaFromJson(String str) => List<AsmaulHusna>.from(
    json.decode(str).map((x) => AsmaulHusna.fromJson(x)));

String asmaulHusnaToJson(List<AsmaulHusna> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AsmaulHusna {
  AsmaulHusna({
    required this.urutan,
    required this.latin,
    required this.arab,
    required this.arti,
  });

  int urutan;
  String latin;
  String arab;
  String arti;

  factory AsmaulHusna.fromJson(Map<String, dynamic> json) => AsmaulHusna(
        urutan: json["urutan"],
        latin: json["latin"],
        arab: json["arab"],
        arti: json["arti"],
      );

  Map<String, dynamic> toJson() => {
        "urutan": urutan,
        "latin": latin,
        "arab": arab,
        "arti": arti,
      };
}
