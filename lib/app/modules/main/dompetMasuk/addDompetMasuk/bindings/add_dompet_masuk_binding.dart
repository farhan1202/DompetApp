import 'package:get/get.dart';

import '../controllers/add_dompet_masuk_controller.dart';

class AddDompetMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDompetMasukController>(
      () => AddDompetMasukController(),
    );
  }
}
