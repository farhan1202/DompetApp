import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allKategori.dart';

class DetailKategoriController extends GetxController {
  //TODO: Implement DetailKategoriController

  Datum data = Get.arguments;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
