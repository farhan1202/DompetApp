import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/Status.dart';
import 'package:mobile_pocket_app/app/data/models/allKategori.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';

class KategoriProvider extends GetConnect {
  /// Fungsi yang digunakan untuk mendapatkan semua data yang ada pada tabel kategori
  /// lalu data dimasukkan ke dalam model [Kategori]
  /// kembalian fungsi berupa model [Kategori]
  Future<Kategori?> getAllKategori() async {
    final respone = await get(dUrl + "getKategori.php");

    Kategori kategori;
    kategori = Kategori.fromJson(respone.body);
    if (kategori.data == null) {
      return null;
    }

    return kategori;
  }

  /// Fungsi yang digunakan untuk merubah status dari akttif menjadi tidak aktif, begitu sebaliknya
  /// request berupa [id][status_id]
  Future<Response> editStat(String id, String status_id) {
    final form = FormData(
      {
        'id': id,
        'status_id': status_id,
      },
    );

    return post(dUrl + 'ubahStatusKategori.php', form);
  }

  /// Fungsi yang digunakan untuk menambahkan data kategori
  /// request berupa [nama][referensi][deskripsi][status_id]
  Future<Response> addKategori(
      String nama, String deskripsi, String status_id) {
    final form = FormData(
      {
        'nama': nama,
        'deskripsi': deskripsi,
        'status_id': status_id,
      },
    );

    return post(dUrl + 'kategori.php', form);
  }

  /// Fungsi yang digunakan untuk mengedit data kategori
  /// request berupa [id][nama][referensi][deskripsi][status_id]
  Future<Response> editKategori(
      String id, String nama, String deskripsi, String status_id) {
    final form = FormData(
      {
        'id': id,
        'nama': nama,
        'deskripsi': deskripsi,
        'status_id': status_id,
      },
    );

    return post(dUrl + 'editKategori.php', form);
  }

  Future<Status?> getAllStatus() async {
    final respone = await get(dUrl + "getStatDompet.php");

    Status status;
    status = Status.fromJson(respone.body);
    if (status.data == null) {
      return null;
    }

    return status;
  }
}
