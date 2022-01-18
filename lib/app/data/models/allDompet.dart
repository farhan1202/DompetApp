//  Model dari JSON GetAllDompet
//
//     final dompet = dompetFromJson(jsonString);

import 'dart:convert';

Dompet dompetFromJson(String str) => Dompet.fromJson(json.decode(str));

String dompetToJson(Dompet data) => json.encode(data.toJson());

class Dompet {
  Dompet({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory Dompet.fromJson(Map<String, dynamic> json) => Dompet(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.nama,
    this.referensi,
    this.deskripsi,
    this.statusId,
  });

  String? id;
  String? nama;
  String? referensi;
  String? deskripsi;
  String? statusId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        referensi: json["referensi"],
        deskripsi: json["deskripsi"],
        statusId: json["status_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "referensi": referensi,
        "deskripsi": deskripsi,
        "status_id": statusId,
      };
}
