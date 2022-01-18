import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';

class AddDompetController extends GetxController {
  //TODO: Implement AddDompetController

  ///inisialisasi variabel controller textediting
  late TextEditingController nameC;
  late TextEditingController referensiC;
  late TextEditingController deskripsiC;

  var dropStatus = 'Aktif'.obs;
  final items = ['Aktif', 'Tidak Aktif'];

  /// fungsi yang digunakan untuk memanggil provider [addDompet]
  Future<void> addDompet(
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
            .addDompet(name, referensi, deskripsi, stat)
            .then((value) {
          var data = value.body;
          if (data['status'] == "200") {
            Get.defaultDialog(
              title: "Sukses",
              middleText: data['message'],
              textConfirm: "OK",
              onConfirm: () {
                Get.back();
                Get.back();
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
    // TODO: implement onInit
    nameC = TextEditingController();
    referensiC = TextEditingController();
    deskripsiC = TextEditingController();
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
