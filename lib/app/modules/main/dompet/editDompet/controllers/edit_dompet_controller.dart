import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';
import 'package:mobile_pocket_app/app/modules/main/dompet/controllers/dompet_controller.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class EditDompetController extends GetxController {
  //TODO: Implement EditDompetController
  late TextEditingController nameC;
  late TextEditingController referensiC;
  late TextEditingController deskripsiC;

  var dropStatus = 'Aktif'.obs;
  final items = ['Aktif', 'Tidak Aktif'];

  Datum data = Get.arguments;

  Future<void> editDompet(
      String name, String referensi, String deskripsi, String status) async {
    if (name != '' || referensi != '' || deskripsi != '') {
      String stat;
      if (status == 'Aktif') {
        stat = "1";
      } else {
        stat = "2";
      }

      try {
        DompetsController()
            .editDomept(
          data.id.toString(),
          name,
          referensi,
          deskripsi,
          stat,
        )
            .then((value) {
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
    } else {
      Get.snackbar("Perhatian", "Harap Isi Semua Data");
    }
  }

  @override
  void onInit() {
    dropStatus.value =
        data.statusId.toString() == '1' ? "Aktif" : "Tidak Aktif";
    // TODO: implement onInit
    nameC = TextEditingController(text: data.nama);
    referensiC = TextEditingController(text: data.referensi);
    deskripsiC = TextEditingController(text: data.deskripsi);
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    referensiC.dispose();
    deskripsiC.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
