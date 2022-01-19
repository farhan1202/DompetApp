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
import '../modules/main/dompetKeluar/addDompetKeluar/bindings/add_dompet_keluar_binding.dart';
import '../modules/main/dompetKeluar/addDompetKeluar/views/add_dompet_keluar_view.dart';
import '../modules/main/dompetKeluar/bindings/dompet_keluar_binding.dart';
import '../modules/main/dompetKeluar/editDompetKeluar/bindings/edit_dompet_keluar_binding.dart';
import '../modules/main/dompetKeluar/editDompetKeluar/views/edit_dompet_keluar_view.dart';
import '../modules/main/dompetKeluar/views/dompet_keluar_view.dart';
import '../modules/main/dompetMasuk/addDompetMasuk/bindings/add_dompet_masuk_binding.dart';
import '../modules/main/dompetMasuk/addDompetMasuk/views/add_dompet_masuk_view.dart';
import '../modules/main/dompetMasuk/bindings/dompet_masuk_binding.dart';
import '../modules/main/dompetMasuk/editDompetMasuk/bindings/edit_dompet_masuk_binding.dart';
import '../modules/main/dompetMasuk/editDompetMasuk/views/edit_dompet_masuk_view.dart';
import '../modules/main/dompetMasuk/views/dompet_masuk_view.dart';
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
    GetPage(
      name: _Paths.DOMPET_MASUK,
      page: () => DompetMasukView(),
      binding: DompetMasukBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_DOMPET_MASUK,
          page: () => AddDompetMasukView(),
          binding: AddDompetMasukBinding(),
        ),
        GetPage(
          name: _Paths.EDIT_DOMPET_MASUK,
          page: () => EditDompetMasukView(),
          binding: EditDompetMasukBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.DOMPET_KELUAR,
      page: () => DompetKeluarView(),
      binding: DompetKeluarBinding(),
      children: [
        GetPage(
          name: _Paths.EDIT_DOMPET_KELUAR,
          page: () => EditDompetKeluarView(),
          binding: EditDompetKeluarBinding(),
        ),
        GetPage(
          name: _Paths.ADD_DOMPET_KELUAR,
          page: () => AddDompetKeluarView(),
          binding: AddDompetKeluarBinding(),
        ),
      ],
    ),
  ];
}
