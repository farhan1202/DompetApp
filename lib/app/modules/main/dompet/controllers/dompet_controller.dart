import 'dart:ffi';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class DompetController extends GetxController {
  //TODO: Implement DompetController
  /// variabel untuk menampung data [dompet]
  RxList<Datum> dompet = List<Datum>.empty().obs;

  /// variabel untuk menampung data [dompet aktif]
  RxList<Datum> dompetAktif = List<Datum>.empty().obs;

  /// variabel untuk menampung data [dompet tidak aktif]
  RxList<Datum> dompetNAktif = List<Datum>.empty().obs;

  ///fungsi yang digunakan untuk memanggil Provider [getAllDompet]
  Future<void> getAllDompet() async {
    try {
      var response = await DompetsController().getAllDompet();

      if (response!.data != null) {
        dompet.clear();
        dompetAktif.clear();
        dompetNAktif.clear();
        response.data?.forEach((element) {
          dompet.add(element);
          if (element.statusId == "1") {
            dompetAktif.add(element);
          } else {
            dompetNAktif.add(element);
          }
        });
        dompet.refresh();
        dompetAktif.refresh();
        dompetNAktif.refresh();
      }
    } catch (e) {
      // Get.snackbar("Error", e.toString());
    }
  }

  ///fungsi yang digunakan untuk memanggil Provider [editStat]
  Future<void> editStatDompet(String id, String status) async {
    String stat;
    if (status == '1') {
      stat = "2";
    } else {
      stat = "1";
    }

    try {
      DompetsController().editStat(id, stat).then((value) {
        var data = value.body;
        if (data['status'] == "200") {
          Get.defaultDialog(
            title: "Sukses",
            middleText: data['message'],
            textConfirm: "OK",
            onConfirm: () {
              Get.offAllNamed(Routes.DOMPET);
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
