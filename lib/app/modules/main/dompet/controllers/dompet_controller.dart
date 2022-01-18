import 'dart:ffi';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';

class DompetController extends GetxController {
  //TODO: Implement DompetController

  RxList<Datum> dompet = List<Datum>.empty().obs;
  RxList<Datum> dompetAktif = List<Datum>.empty().obs;
  RxList<Datum> dompetNAktif = List<Datum>.empty().obs;

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
      Get.snackbar("Error", e.toString());
    }
  }
}
