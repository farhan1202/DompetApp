import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allKategori.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';

class KategoriProvider extends GetConnect {
  Future<Kategori?> getAllDompet() async {
    final respone = await get(dUrl + "getKategori.php");

    Kategori kategori;
    kategori = Kategori.fromJson(respone.body);
    if (kategori.data == null) {
      return null;
    }

    return kategori;
  }

  Future<Response> editStat(String id, String status_id) {
    final form = FormData(
      {
        'id': id,
        'status_id': status_id,
      },
    );

    return post(dUrl + 'ubahStatusKategori.php', form);
  }

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
}
