import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_dompet_keluar_controller.dart';

class EditDompetKeluarView extends GetView<EditDompetKeluarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditDompetKeluarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditDompetKeluarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
