import 'package:get/get.dart';

import '../controllers/add_dompet_keluar_controller.dart';

class AddDompetKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDompetKeluarController>(
      () => AddDompetKeluarController(),
    );
  }
}
