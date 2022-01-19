import 'package:get/get.dart';

import '../controllers/edit_dompet_masuk_controller.dart';

class EditDompetMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDompetMasukController>(
      () => EditDompetMasukController(),
    );
  }
}
