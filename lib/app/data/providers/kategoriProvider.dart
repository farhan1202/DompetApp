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
}
