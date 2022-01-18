import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/providers/kategoriProvider.dart';

class AddKategoriController extends GetxController {
  //TODO: Implement AddKategoriController

  ///inisialisasi variabel controller textediting
  late TextEditingController nameC;
  late TextEditingController deskripsiC;

  var dropStatus = 'Aktif'.obs;
  final items = ['Aktif', 'Tidak Aktif'];

  /// fungsi yang digunakan untuk memanggil provider [addDompet]
  Future<void> addKategori(String name, String deskripsi, String status) async {
    if (name != '' || deskripsi != '') {
      String stat;
      if (status == 'Aktif') {
        stat = "1";
      } else {
        stat = "2";
      }
      try {
        KategoriProvider().addKategori(name, deskripsi, stat).then((value) {
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
    deskripsiC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    deskripsiC.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
