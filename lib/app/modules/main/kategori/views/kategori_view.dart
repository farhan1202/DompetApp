import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';
import 'package:mobile_pocket_app/app/modules/main/kategori/views/widgets/cardItemKategori.dart';
import 'package:mobile_pocket_app/app/modules/main/kategori/views/widgets/tabBarKategori.dart';
import 'package:mobile_pocket_app/app/modules/utils/widgets/NavDrawerWid.dart';
import 'package:mobile_pocket_app/app/modules/utils/widgets/SearchBar.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  @override
  Widget build(BuildContext context) {
    var pading = MediaQuery.of(context).viewPadding;
    var height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        pading.top -
        pading.bottom;

    return Scaffold(
      drawer: NavBarDrawer(),
      appBar: AppBar(
        title: Text('Kategori'),
        actions: [SearchBar()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_KATEGORI);
        },
        backgroundColor: kPrimaryColor,
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBarKategori(height: height),
              FutureBuilder(
                future: controller.getAllKategori(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loading"));
                  }
                  if (controller.kategori.length == 0) {
                    return Center(child: Text("Data Tidak Ada"));
                  }
                  return Container(
                    height: height * 0.9,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: controller.kategori.length,
                          itemBuilder: (context, index) => CardItemKategori(
                            height: height,
                            i: index,
                            data: controller.kategori,
                          ),
                        ),
                        ListView.builder(
                          itemCount: controller.kategoriAktif.length,
                          itemBuilder: (context, index) => CardItemKategori(
                            height: height,
                            i: index,
                            data: controller.kategoriAktif,
                          ),
                        ),
                        ListView.builder(
                          itemCount: controller.kategoriNAktif.length,
                          itemBuilder: (context, index) => CardItemKategori(
                            height: height,
                            i: index,
                            data: controller.kategoriNAktif,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
