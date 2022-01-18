import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KategoriView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KategoriView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
