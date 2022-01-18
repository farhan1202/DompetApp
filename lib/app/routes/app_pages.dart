import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/dompet/addDompet/bindings/add_dompet_binding.dart';
import '../modules/main/dompet/addDompet/views/add_dompet_view.dart';
import '../modules/main/dompet/bindings/dompet_binding.dart';
import '../modules/main/dompet/views/dompet_view.dart';
import '../modules/main/kategori/bindings/kategori_binding.dart';
import '../modules/main/kategori/views/kategori_view.dart';
import '../modules/main/main/bindings/main_binding.dart';
import '../modules/main/main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DOMPET;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.DOMPET,
      page: () => DompetView(),
      binding: DompetBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_DOMPET,
          page: () => AddDompetView(),
          binding: AddDompetBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.KATEGORI,
      page: () => KategoriView(),
      binding: KategoriBinding(),
    ),
  ];
}
