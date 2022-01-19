import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mobile_pocket_app/app/data/models/Status.dart' as dStatus;
import 'package:mobile_pocket_app/app/data/models/allDompet.dart' as dDompet;
import 'package:mobile_pocket_app/app/data/models/allKategori.dart'
    as dKategori;
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';
import 'package:mobile_pocket_app/app/data/providers/kategoriProvider.dart';
import 'package:mobile_pocket_app/app/data/providers/transaksiProvider.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class AddDompetKeluarController extends GetxController {
  //TODO: Implement AddDompetKeluarController

  ///inisialisasi variabel controller textediting

  late TextEditingController nilaiC;
  late TextEditingController deskripsiC;
  late TextEditingController dateC;
  var dateSlug =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}"
          .obs;

  RxList<dStatus.Datum> status = List<dStatus.Datum>.empty().obs;
  RxList<dDompet.Datum> dompet = List<dDompet.Datum>.empty().obs;
  RxList<dKategori.Datum> kategori = List<dKategori.Datum>.empty().obs;

  var dropStatus = ''.obs;
  var dropDompet = ''.obs;
  var dropKategori = ''.obs;
  // final items = ['Aktif', 'Tidak Aktif'];

  Future<void> addTransaksi(String deskripsi, String nilai, String tanggal,
      String statusId, String dompetId, String kategoriId) async {
    if (deskripsi != '' ||
        nilai != '' ||
        tanggal != '' ||
        statusId != '' ||
        dompetId != '' ||
        kategoriId != '') {
      if (int.parse(nilai) >= 0) {
        String stat = '';
        if (statusId == 'Aktif') {
          stat = "1";
        } else if (statusId == 'Tidak Aktif') {
          stat = "2";
        }

        try {
          TransaksiProvider()
              .addTransaksi(
            deskripsi,
            nilai,
            dateSlug.value,
            stat,
            dompetId,
            kategoriId,
            "2",
          )
              .then((value) {
            var data = value.body;
            if (data['status'] == "200") {
              Get.defaultDialog(
                title: "Sukses",
                middleText: data['message'],
                textConfirm: "OK",
                onConfirm: () {
                  Get.offAllNamed(Routes.DOMPET_KELUAR);
                },
              );
            } else {
              Get.defaultDialog(
                title: "Faileds",
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
        Get.snackbar("Perhatian", "nilai tidak boleh minus");
      }
    } else {
      Get.snackbar("Perhatian", "Harap Isi Semua Data");
    }
  }

  Future<RxList<dStatus.Datum>> getDataStatus() async {
    var response = await TransaksiProvider().getAllStatus();
    if (response!.data != null) {
      status.clear();
      response.data!.forEach((element) {
        status.add(element);
      });

      status.refresh();
    }

    return status;
  }

  Future<RxList<dDompet.Datum>> getDataDompet() async {
    var response = await DompetsController().getAllDompet();
    if (response!.data != null) {
      dompet.clear();
      response.data!.forEach((element) {
        if (element.statusId.toString() == "1") dompet.add(element);
      });

      dompet.refresh();
    }

    return dompet;
  }

  Future<RxList<dKategori.Datum>> getDataKategori() async {
    var response = await KategoriProvider().getAllKategori();
    if (response!.data != null) {
      kategori.clear();
      response.data!.forEach((element) {
        if (element.statusId.toString() == "1") kategori.add(element);
      });

      kategori.refresh();
    }

    return kategori;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    nilaiC = TextEditingController();
    deskripsiC = TextEditingController();
    dateC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nilaiC.dispose();
    deskripsiC.dispose();
    dateC.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
