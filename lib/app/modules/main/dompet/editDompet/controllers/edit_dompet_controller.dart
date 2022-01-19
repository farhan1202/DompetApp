import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';
import 'package:mobile_pocket_app/app/data/models/Status.dart' as dataStat;
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';
import 'package:mobile_pocket_app/app/modules/main/dompet/controllers/dompet_controller.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class EditDompetController extends GetxController {
  //TODO: Implement EditDompetController

  /// inisialisasi variabel controller edit text
  late TextEditingController nameC;
  late TextEditingController referensiC;
  late TextEditingController deskripsiC;

  var dropStatus = ''.obs;
  // final items = ['Aktif', 'Tidak Aktif'];

  RxList<dataStat.Datum> status = List<dataStat.Datum>.empty().obs;

  /// variabel yang digunakan untuk menampung data dari halaman sebelumnya
  Datum data = Get.arguments;

  /// fungsi yang digunakan untuk memanggil provider [editDompet]
  Future<void> editDompet(
      String name, String referensi, String deskripsi, String status) async {
    if (name != '' || referensi != '' || deskripsi != '') {
      String stat = '';
      if (status == 'Aktif') {
        stat = "1";
      } else if (status == 'Tidak Aktif') {
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

  Future<RxList<dataStat.Datum>> getDataStatus() async {
    var response = await DompetsController().getAllStatus();
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
