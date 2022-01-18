import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';

class DompetsController extends GetConnect {
  Future<Dompet?> getAllDompet() async {
    final respone = await get(dUrl + "getDompet.php");

    Dompet dompet;
    dompet = Dompet.fromJson(respone.body);
    if (dompet.data == null) {
      return null;
    }

    return dompet;
  }

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

  Future<Response> editStat(String id, String status_id) {
    final form = FormData(
      {
        'id': id,
        'status_id': status_id,
      },
    );

    return post(dUrl + 'ubahStatusDompet.php', form);
  }
}
