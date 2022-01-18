import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/modules/utils/widgets/NavDrawerWid.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarDrawer(),
      appBar: AppBar(
        title: Text('Dompet Farhan'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MainView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
