import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_dompet_controller.dart';

class DetailDompetView extends GetView<DetailDompetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailDompetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.data.nama.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
