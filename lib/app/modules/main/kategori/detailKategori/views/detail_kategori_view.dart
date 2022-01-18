import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_kategori_controller.dart';

class DetailKategoriView extends GetView<DetailKategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailKategoriView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailKategoriView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
