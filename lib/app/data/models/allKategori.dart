/// Model yang di dapat dari JSON respon [getAllKategori]
//
//     final kategori = kategoriFromJson(jsonString);

import 'dart:convert';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  Kategori({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
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
    this.deskripsi,
    this.statusId,
  });

  String? id;
  String? nama;
  String? deskripsi;
  String? statusId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        statusId: json["status_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "status_id": statusId,
      };
}
