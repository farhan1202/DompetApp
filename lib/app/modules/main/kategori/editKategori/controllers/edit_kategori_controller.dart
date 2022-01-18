import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allKategori.dart';
import 'package:mobile_pocket_app/app/data/providers/kategoriProvider.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class EditKategoriController extends GetxController {
  //TODO: Implement EditKategoriController

  /// inisialisasi variabel controller edit text
  late TextEditingController nameC;
  late TextEditingController deskripsiC;

  var dropStatus = 'Aktif'.obs;
  final items = ['Aktif', 'Tidak Aktif'];

  /// variabel yang digunakan untuk menampung data dari halaman sebelumnya
  Datum data = Get.arguments;

  /// fungsi yang digunakan untuk memanggil provider [editKategori]
  Future<void> editKategori(
      String name, String deskripsi, String status) async {
    if (name != '' || deskripsi != '') {
      String stat;
      if (status == 'Aktif') {
        stat = "1";
      } else {
        stat = "2";
      }

      try {
        KategoriProvider()
            .editKategori(
          data.id.toString(),
          name,
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
    deskripsiC = TextEditingController(text: data.deskripsi);
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
