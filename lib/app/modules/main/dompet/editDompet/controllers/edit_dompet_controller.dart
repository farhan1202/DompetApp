import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';

class EditDompetController extends GetxController {
  //TODO: Implement EditDompetController
  late TextEditingController nameC;
  late TextEditingController referensiC;
  late TextEditingController deskripsiC;

  var dropStatus = 'Aktif'.obs;
  final items = ['Aktif', 'Tidak Aktif'];
  final count = 0.obs;

  Datum data = Get.arguments;

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
