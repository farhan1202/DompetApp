import 'package:get/get.dart';

import '../controllers/dompet_keluar_controller.dart';

class DompetKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetKeluarController>(
      () => DompetKeluarController(),
    );
  }
}
