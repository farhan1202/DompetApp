import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allKategori.dart';
import 'package:mobile_pocket_app/app/data/models/Status.dart' as dataStat;
import 'package:mobile_pocket_app/app/data/providers/kategoriProvider.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class EditKategoriController extends GetxController {
  //TODO: Implement EditKategoriController

  /// inisialisasi variabel controller edit text
  late TextEditingController nameC;
  late TextEditingController deskripsiC;

  RxList<dataStat.Datum> status = List<dataStat.Datum>.empty().obs;

  var dropStatus = ''.obs;
  // final items = ['Aktif', 'Tidak Aktif'];

  /// variabel yang digunakan untuk menampung data dari halaman sebelumnya
  Datum data = Get.arguments;

  /// fungsi yang digunakan untuk memanggil provider [editKategori]
  Future<void> editKategori(
      String name, String deskripsi, String status) async {
    if (name.length >= 5 && deskripsi.length <= 100) {
      String stat = '';
      if (status == 'Aktif') {
        stat = "1";
      } else if (status == 'Tidak Aktif') {
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
      Get.snackbar("Perhatian", "Nama minimal 5 huruf");
    }
  }

  Future<RxList<dataStat.Datum>> getDataStatus() async {
    var response = await KategoriProvider().getAllStatus();
    if (response!.data != null) {
      status.clear();
      response.data!.forEach((element) {
        status.add(element);
      });

      status.refresh();
    }

    return status;
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
