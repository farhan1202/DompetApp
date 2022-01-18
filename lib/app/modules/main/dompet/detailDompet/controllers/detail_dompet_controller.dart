import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';

class DetailDompetController extends GetxController {
  //TODO: Implement DetailDompetController

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
