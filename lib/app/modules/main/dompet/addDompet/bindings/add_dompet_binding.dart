import 'package:get/get.dart';

import '../controllers/add_dompet_controller.dart';

class AddDompetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDompetController>(
      () => AddDompetController(),
    );
  }
}
