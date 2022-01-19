import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dompet_keluar_controller.dart';

class DompetKeluarView extends GetView<DompetKeluarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DompetKeluarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DompetKeluarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
