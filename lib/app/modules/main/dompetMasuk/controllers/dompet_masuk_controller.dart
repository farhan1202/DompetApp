import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allTransaksi.dart';
import 'package:mobile_pocket_app/app/data/providers/transaksiProvider.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class DompetMasukController extends GetxController {
  //TODO: Implement DompetMasukController

  /// variabel untuk menampung data [dompetM]
  RxList<Datum> dompetM = List<Datum>.empty().obs;

  /// variabel untuk menampung data [dompetM aktif]
  RxList<Datum> dompetMAktif = List<Datum>.empty().obs;

  /// variabel untuk menampung data [dompetM tidak aktif]
  RxList<Datum> dompetMNAktif = List<Datum>.empty().obs;

  ///fungsi yang digunakan untuk memanggil Provider [getAllDompet]
  Future<void> getAllDompetMasuk() async {
    try {
      var response = await TransaksiProvider().getAllKategori("1");

      if (response!.data != null) {
        dompetM.clear();
        dompetMAktif.clear();
        dompetMNAktif.clear();
        response.data?.forEach((element) {
          dompetM.add(element);
          if (element.statusId == "1") {
            dompetMAktif.add(element);
          } else {
            dompetMNAktif.add(element);
          }
        });
        dompetM.refresh();
        dompetMAktif.refresh();
        dompetMNAktif.refresh();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> editStatDompet(String id, String status) async {
    String stat;
    if (status == '1') {
      stat = "2";
    } else {
      stat = "1";
    }

    try {
      TransaksiProvider().editStat(id, stat).then((value) {
        var data = value.body;
        if (data['status'] == "200") {
          Get.defaultDialog(
            title: "Sukses",
            middleText: data['message'],
            textConfirm: "OK",
            onConfirm: () {
              Get.offAllNamed(Routes.DOMPET_MASUK);
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
