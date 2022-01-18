import 'package:get/get.dart';

import '../controllers/detail_dompet_controller.dart';

class DetailDompetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDompetController>(
      () => DetailDompetController(),
    );
  }
}
