import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';
import 'package:mobile_pocket_app/app/modules/main/kategori/controllers/kategori_controller.dart';

class TabBarKategori extends GetView<KategoriController> {
  const TabBarKategori({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      child: Center(
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF292639),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Obx(
              () => TabBar(
                indicator: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                tabs: [
                  Tab(text: "Semua (${controller.kategori.length})"),
                  Tab(text: "Aktif (${controller.kategoriAktif.length})"),
                  Tab(
                      text:
                          "Tidak Aktif (${controller.kategoriNAktif.length})"),
                ],
              ),
            )),
      ),
    );
  }
}
