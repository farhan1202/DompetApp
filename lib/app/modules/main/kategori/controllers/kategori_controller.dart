import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allKategori.dart';
import 'package:mobile_pocket_app/app/data/providers/kategoriProvider.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class KategoriController extends GetxController {
  //TODO: Implement KategoriController

  /// variabel untuk menampung data [kategori]
  RxList<Datum> kategori = List<Datum>.empty().obs;

  /// variabel untuk menampung data [kategori aktif]
  RxList<Datum> kategoriAktif = List<Datum>.empty().obs;

  /// variabel untuk menampung data [kategori tidak aktif]
  RxList<Datum> kategoriNAktif = List<Datum>.empty().obs;

  ///fungsi yang digunakan untuk memanggil [KategoriProvide] untuk menggunakan
  ///fungsi [getAllKategori]
  Future<void> getAllKategori() async {
    try {
      var response = await KategoriProvider().getAllKategori();

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
      // Get.snackbar("Error", e.toString());
    }
  }

  ///fungsi yang digunakan untuk memanggil [KategoriProvider]
  /// dan melakukan request untuk merupah status data
  Future<void> editStatKategori(String id, String status) async {
    String stat;
    if (status == '1') {
      stat = "2";
    } else {
      stat = "1";
    }

    try {
      KategoriProvider().editStat(id, stat).then((value) {
        var data = value.body;
        if (data['status'] == "200") {
          Get.defaultDialog(
            title: "Sukses",
            middleText: data['message'],
            textConfirm: "OK",
            onConfirm: () {
              Get.offAllNamed(Routes.KATEGORI);
            },
          );
        } else {
          Get.defaultDialog(
            title: "Failed",
            middleText: data['message'],
            textConfirm: "OK",
            onConfirm: () {
              Get.back();
            },
          );
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
