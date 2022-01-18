import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';
import 'package:mobile_pocket_app/app/modules/utils/widgets/NavDrawerWid.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

import '../controllers/dompet_controller.dart';
import 'widgets/cardItemDompet.dart';
import 'widgets/tabBarDompet.dart';

class DompetView extends GetView<DompetController> {
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
          title: Text('Dompet Farhan'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_DOMPET);
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
                tabBarDompet(height: height),
                FutureBuilder(
                  future: controller.getAllDompet(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text("Loading"));
                    }
                    if (controller.dompet.length == 0) {
                      return Center(child: Text("Data Tidak Ada"));
                    }
                    return Container(
                      height: height * 0.9,
                      child: TabBarView(
                        children: [
                          ListView.builder(
                            itemCount: controller.dompet.length,
                            itemBuilder: (context, index) => CardItemDompet(
                              height: height,
                              i: index,
                              data: controller.dompet,
                            ),
                          ),
                          ListView.builder(
                            itemCount: controller.dompetAktif.length,
                            itemBuilder: (context, index) => CardItemDompet(
                              height: height,
                              i: index,
                              data: controller.dompetAktif,
                            ),
                          ),
                          ListView.builder(
                            itemCount: controller.dompetNAktif.length,
                            itemBuilder: (context, index) => CardItemDompet(
                              height: height,
                              i: index,
                              data: controller.dompetNAktif,
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
        ));
  }
}
