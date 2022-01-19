import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_dompet_keluar_controller.dart';

class AddDompetKeluarView extends GetView<AddDompetKeluarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddDompetKeluarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddDompetKeluarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
