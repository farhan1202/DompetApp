import 'package:get/get.dart';

import '../controllers/edit_dompet_keluar_controller.dart';

class EditDompetKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDompetKeluarController>(
      () => EditDompetKeluarController(),
    );
  }
}
