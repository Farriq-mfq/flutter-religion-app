// To parse this JSON data, do
//
//     final jadwalSholat = jadwalSholatFromJson(jsonString);

import 'dart:convert';

JadwalSholat jadwalSholatFromJson(String str) =>
    JadwalSholat.fromJson(json.decode(str));

String jadwalSholatToJson(JadwalSholat data) => json.encode(data.toJson());

class JadwalSholat {
  JadwalSholat({
    required this.ashar,
    required this.dhuha,
    required this.dzuhur,
    required this.imsak,
    required this.isya,
    required this.maghrib,
    required this.subuh,
    required this.tanggal,
    required this.terbit,
  });

  String ashar;
  String dhuha;
  String dzuhur;
  String imsak;
  String isya;
  String maghrib;
  String subuh;
  String tanggal;
  String terbit;

  factory JadwalSholat.fromJson(Map<String, dynamic> json) => JadwalSholat(
        ashar: json["ashar"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        imsak: json["imsak"],
        isya: json["isya"],
        maghrib: json["maghrib"],
        subuh: json["subuh"],
        tanggal: json["tanggal"],
        terbit: json["terbit"],
      );

  Map<String, dynamic> toJson() => {
        "ashar": ashar,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "imsak": imsak,
        "isya": isya,
        "maghrib": maghrib,
        "subuh": subuh,
        "tanggal": tanggal,
        "terbit": terbit,
      };
}
