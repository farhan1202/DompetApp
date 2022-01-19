import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_dompet_masuk_controller.dart';

class EditDompetMasukView extends GetView<EditDompetMasukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditDompetMasukView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditDompetMasukView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
