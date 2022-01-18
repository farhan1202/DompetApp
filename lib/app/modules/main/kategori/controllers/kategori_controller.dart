import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allKategori.dart';
import 'package:mobile_pocket_app/app/data/providers/kategoriProvider.dart';

class KategoriController extends GetxController {
  //TODO: Implement KategoriController

  /// variabel untuk menampung data [kategori]
  RxList<Datum> kategori = List<Datum>.empty().obs;

  /// variabel untuk menampung data [kategori aktif]
  RxList<Datum> kategoriAktif = List<Datum>.empty().obs;

  /// variabel untuk menampung data [kategori tidak aktif]
  RxList<Datum> kategoriNAktif = List<Datum>.empty().obs;

  Future<void> getAllKategori() async {
    try {
      var response = await KategoriProvider().getAllDompet();

      if (response!.data != null) {
        kategori.clear();
        kategoriAktif.clear();
        kategoriNAktif.clear();
        response.data?.forEach((element) {
          kategori.add(element);
          if (element.statusId == "1") {
            kategoriAktif.add(element);
          } else {
            kategoriNAktif.add(element);
          }
        });
        kategori.refresh();
        kategoriAktif.refresh();
        kategoriNAktif.refresh();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
