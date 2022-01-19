// To parse this JSON data, do
//
//     final transaksi = transaksiFromJson(jsonString);

import 'dart:convert';

Transaksi transaksiFromJson(String str) => Transaksi.fromJson(json.decode(str));

String transaksiToJson(Transaksi data) => json.encode(data.toJson());

class Transaksi {
  Transaksi({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
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
    this.kode,
    this.deskripsi,
    this.tanggal,
    this.nilai,
    this.dompetId,
    this.namaDompet,
    this.kategoriId,
    this.namaKategori,
    this.transaksiId,
    this.statusId,
  });

  String? id;
  String? kode;
  String? deskripsi;
  String? tanggal;
  String? nilai;
  String? dompetId;
  String? namaDompet;
  String? kategoriId;
  String? namaKategori;
  String? transaksiId;
  String? statusId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        kode: json["kode"],
        deskripsi: json["deskripsi"],
        tanggal: json["tanggal"],
        nilai: json["nilai"],
        dompetId: json["dompet_id"],
        namaDompet: json["nama_dompet"],
        kategoriId: json["kategori_id"],
        namaKategori: json["nama_kategori"],
        transaksiId: json["transaksi_id"],
        statusId: json["status_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "deskripsi": deskripsi,
        "tanggal": tanggal,
        "nilai": nilai,
        "dompet_id": dompetId,
        "nama_dompet": namaDompet,
        "kategori_id": kategoriId,
        "nama_kategori": namaKategori,
        "transaksi_id": transaksiId,
        "status_id": statusId,
      };
}
