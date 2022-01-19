import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/Status.dart' as dStatus;
import 'package:mobile_pocket_app/app/data/models/allDompet.dart' as dDompet;
import 'package:mobile_pocket_app/app/data/models/allKategori.dart'
    as dKategori;
import 'package:mobile_pocket_app/app/data/models/allTransaksi.dart';
import 'package:mobile_pocket_app/app/data/providers/dompetProvider.dart';
import 'package:mobile_pocket_app/app/data/providers/kategoriProvider.dart';
import 'package:mobile_pocket_app/app/data/providers/transaksiProvider.dart';

class AddDompetMasukController extends GetxController {
  //TODO: Implement AddDompetMasukController

  ///inisialisasi variabel controller textediting

  late TextEditingController nilaiC;
  late TextEditingController deskripsiC;

  RxList<dStatus.Datum> status = List<dStatus.Datum>.empty().obs;
  RxList<dDompet.Datum> dompet = List<dDompet.Datum>.empty().obs;
  RxList<dKategori.Datum> kategori = List<dKategori.Datum>.empty().obs;

  var dropStatus = ''.obs;
  var dropDompet = ''.obs;
  var dropKategori = ''.obs;
  // final items = ['Aktif', 'Tidak Aktif'];

  /// fungsi yang digunakan untuk memanggil provider [addDompet]

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
        dompet.add(element);
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
        kategori.add(element);
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
