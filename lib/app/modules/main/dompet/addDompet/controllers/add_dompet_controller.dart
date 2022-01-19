import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/Status.dart';
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class AddDompetController extends GetxController {
  //TODO: Implement AddDompetController

  ///inisialisasi variabel controller textediting
  late TextEditingController nameC;
  late TextEditingController referensiC;
  late TextEditingController deskripsiC;

  RxList<Datum> status = List<Datum>.empty().obs;

  var dropStatus = ''.obs;
  // final items = ['Aktif', 'Tidak Aktif'];

  /// fungsi yang digunakan untuk memanggil provider [addDompet]
  Future<void> addDompet(
      String name, String referensi, String deskripsi, String status) async {
    if (name != '' || referensi != '' || deskripsi != '' || status != '') {
      String stat = '';
      if (status == 'Aktif') {
        stat = "1";
      } else if (status == 'Tidak Aktif') {
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
                Get.offNamed(Routes.DOMPET);
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

  Future<RxList<Datum>> getDataStatus() async {
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
