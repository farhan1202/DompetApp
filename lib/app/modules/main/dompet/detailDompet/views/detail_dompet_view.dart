import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_dompet_controller.dart';

class DetailDompetView extends GetView<DetailDompetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Dompet'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: decoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nama",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${controller.data.nama}")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: decoration(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Referensi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${controller.data.referensi}")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Deskripsi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${controller.data.deskripsi}")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: decoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      controller.data.statusId == '1' ? "Aktif" : "Tidak AKtif")
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 15),
          )
        ]);
  }
}
