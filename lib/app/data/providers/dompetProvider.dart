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
      String nama, String referensi, String deskripsi, status_id) {
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
}
