import 'package:get/get.dart';

import '../controllers/edit_dompet_controller.dart';

class EditDompetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDompetController>(
      () => EditDompetController(),
    );
  }
}
