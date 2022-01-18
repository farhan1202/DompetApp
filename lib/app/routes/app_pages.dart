import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/dompet/addDompet/bindings/add_dompet_binding.dart';
import '../modules/main/dompet/addDompet/views/add_dompet_view.dart';
import '../modules/main/dompet/bindings/dompet_binding.dart';
import '../modules/main/dompet/detailDompet/bindings/detail_dompet_binding.dart';
import '../modules/main/dompet/detailDompet/views/detail_dompet_view.dart';
import '../modules/main/dompet/editDompet/bindings/edit_dompet_binding.dart';
import '../modules/main/dompet/editDompet/views/edit_dompet_view.dart';
import '../modules/main/dompet/views/dompet_view.dart';
import '../modules/main/kategori/addKategori/bindings/add_kategori_binding.dart';
import '../modules/main/kategori/addKategori/views/add_kategori_view.dart';
import '../modules/main/kategori/bindings/kategori_binding.dart';
import '../modules/main/kategori/detailKategori/bindings/detail_kategori_binding.dart';
import '../modules/main/kategori/detailKategori/views/detail_kategori_view.dart';
import '../modules/main/kategori/editKategori/bindings/edit_kategori_binding.dart';
import '../modules/main/kategori/editKategori/views/edit_kategori_view.dart';
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
        GetPage(
          name: _Paths.DETAIL_DOMPET,
          page: () => DetailDompetView(),
          binding: DetailDompetBinding(),
        ),
        GetPage(
          name: _Paths.EDIT_DOMPET,
          page: () => EditDompetView(),
          binding: EditDompetBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.KATEGORI,
      page: () => KategoriView(),
      binding: KategoriBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_KATEGORI,
          page: () => AddKategoriView(),
          binding: AddKategoriBinding(),
        ),
        GetPage(
          name: _Paths.EDIT_KATEGORI,
          page: () => EditKategoriView(),
          binding: EditKategoriBinding(),
        ),
        GetPage(
          name: _Paths.DETAIL_KATEGORI,
          page: () => DetailKategoriView(),
          binding: DetailKategoriBinding(),
        ),
      ],
    ),
  ];
}
