import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';
import 'package:mobile_pocket_app/app/modules/main/dompetKeluar/views/widgets/cardItemDompetKeluar.dart';
import 'package:mobile_pocket_app/app/modules/main/dompetKeluar/views/widgets/tabBarKeluar.dart';
import 'package:mobile_pocket_app/app/modules/utils/widgets/NavDrawerWid.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

import '../controllers/dompet_keluar_controller.dart';

class DompetKeluarView extends GetView<DompetKeluarController> {
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
        title: Text('Dompet Keluar'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_DOMPET_KELUAR);
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
              TabBarDompetKeluar(height: height),
              FutureBuilder(
                future: controller.getAllDompetMasuk(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loading"));
                  }
                  if (controller.dompetM.length == 0) {
                    return Center(child: Text("Data Tidak Ada"));
                  }
                  return Container(
                    height: height * 0.9,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: controller.dompetM.length,
                          itemBuilder: (context, index) => CardItemDompetKeluar(
                            height: height,
                            i: index,
                            data: controller.dompetM,
                          ),
                        ),
                        ListView.builder(
                          itemCount: controller.dompetMAktif.length,
                          itemBuilder: (context, index) => CardItemDompetKeluar(
                            height: height,
                            i: index,
                            data: controller.dompetMAktif,
                          ),
                        ),
                        ListView.builder(
                          itemCount: controller.dompetMNAktif.length,
                          itemBuilder: (context, index) => CardItemDompetKeluar(
                            height: height,
                            i: index,
                            data: controller.dompetMNAktif,
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
