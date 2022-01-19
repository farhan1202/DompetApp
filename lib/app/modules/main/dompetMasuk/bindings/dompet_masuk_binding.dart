import 'package:get/get.dart';

import '../controllers/dompet_masuk_controller.dart';

class DompetMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetMasukController>(
      () => DompetMasukController(),
    );
  }
}
