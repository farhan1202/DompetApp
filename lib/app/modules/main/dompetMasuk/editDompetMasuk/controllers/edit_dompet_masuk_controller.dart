import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allTransaksi.dart';

import 'package:mobile_pocket_app/app/data/models/Status.dart' as dStatus;
import 'package:mobile_pocket_app/app/data/models/allDompet.dart' as dDompet;
import 'package:mobile_pocket_app/app/data/models/allKategori.dart'
    as dKategori;
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';
import 'package:mobile_pocket_app/app/data/providers/kategoriProvider.dart';
import 'package:mobile_pocket_app/app/data/providers/transaksiProvider.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class EditDompetMasukController extends GetxController {
  //TODO: Implement EditDompetMasukController

  Datum data = Get.arguments;

  ///inisialisasi variabel controller textediting
  late TextEditingController nilaiC;
  late TextEditingController deskripsiC;
  late TextEditingController dateC;
  var dateSlug =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}"
          .obs;

  /// Variabel untuk menampung list [status] yang aktif
  RxList<dStatus.Datum> status = List<dStatus.Datum>.empty().obs;

  /// Variabel untuk menampung list [dompet] yang aktif
  RxList<dDompet.Datum> dompet = List<dDompet.Datum>.empty().obs;

  /// Variabel untuk menampung list [kategori] yang aktif
  RxList<dKategori.Datum> kategori = List<dKategori.Datum>.empty().obs;

  var dropStatus = ''.obs;
  var dropDompet = ''.obs;
  var dropKategori = ''.obs;
  // final items = ['Aktif', 'Tidak Aktif'];

  ///fungsi yang digunakan untuk memanggil transaksiprovider [editdompetmasuk]
  Future<void> editDompetMasuk(String deskripsi, String nilai, String statusId,
      String dompetId, String kategoriId) async {
    if (nilai != '' || statusId != '' || dompetId != '' || kategoriId != '') {
      if (deskripsi.length <= 100) {
        if (int.parse(nilai) >= 0) {
          String stat = '';
          if (statusId == 'Aktif') {
            stat = "1";
          } else if (statusId == 'Tidak Aktif') {
            stat = "2";
          }

          try {
            TransaksiProvider()
                .editTransaksi(
              data.id.toString(),
              deskripsi,
              nilai,
              stat,
              dompetId,
              kategoriId,
            )
                .then((value) {
              var data = value.body;
              if (data['status'] == "200") {
                Get.defaultDialog(
                  title: "Sukses",
                  middleText: data['message'],
                  textConfirm: "OK",
                  onConfirm: () {
                    Get.offAllNamed(Routes.DOMPET_MASUK);
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
        Get.snackbar("Perhatian", "Deskripsi maksimal 100 kata");
      }
    } else {
      Get.snackbar("Perhatian", "Harap Isi Semua Data");
    }
  }

  ///fungsi yang digunakan untuk mendapatkan list `status`
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

  ///fungsi yang digunakan untuk mendapatkan list `dompet`
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

  ///fungsi yang digunakan untuk mendapatkan list `kategori`
  Future<RxList<dKategori.Datum>> getDataKategori() async {
    var response = await KategoriProvider().getAllKategori();
    if (response!.data != null) {
      kategori.clear();
      response.data!.forEach((element) {
        if (element.statusId.toString() == '1') kategori.add(element);
      });

      kategori.refresh();
    }

    return kategori;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    dropStatus.value =
        data.statusId.toString() == '1' ? "Aktif" : "Tidak Aktif";
    dropDompet.value = data.dompetId.toString();
    dropKategori.value = data.kategoriId.toString();
    nilaiC = TextEditingController(text: data.nilai);
    deskripsiC = TextEditingController(text: data.deskripsi);
    super.onInit();
  }

  @override
  void onClose() {
    nilaiC.dispose();
    deskripsiC.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
