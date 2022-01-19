import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/Status.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';

class DompetsController extends GetConnect {
  /// Fungsi yang digunakan untuk mendapatkan semua data yang ada pada tabel dompet
  /// lalu data dimasukkan ke dalam model [Dompet]
  /// kembalian fungsi berupa model [Dompet]
  Future<Dompet?> getAllDompet() async {
    final respone = await get(dUrl + "getDompet.php");

    Dompet dompet;
    dompet = Dompet.fromJson(respone.body);
    if (dompet.data == null) {
      return null;
    }

    return dompet;
  }

  /// Fungsi yang digunakan untuk menambahkan data dompet
  /// request berupa [nama][referensi][deskripsi][status_id]
  Future<Response> addDompet(
      String nama, String referensi, String deskripsi, String status_id) {
    final form = FormData(
      {
        'nama': nama,
        'referensi': referensi,
        'deskripsi': deskripsi,
        'status_id': status_id,
      },
    );

    return post(dUrl + 'dompet.php', form);
  }

  /// Fungsi yang digunakan untuk mengedit data dompet
  /// request berupa [id][nama][referensi][deskripsi][status_id]
  Future<Response> editDomept(String id, String nama, String referensi,
      String deskripsi, String status_id) {
    final form = FormData(
      {
        'id': id,
        'nama': nama,
        'referensi': referensi,
        'deskripsi': deskripsi,
        'status_id': status_id,
      },
    );

    return post(dUrl + 'editDompet.php', form);
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

    return post(dUrl + 'ubahStatusDompet.php', form);
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
