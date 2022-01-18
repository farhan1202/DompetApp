import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';

import '../controllers/add_kategori_controller.dart';
import 'widgets/inputField.dart';
import 'widgets/inputStatus.dart';

class AddKategoriView extends GetView<AddKategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Kategori'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                inputField(
                  title: "Name",
                  controllerC: controller.nameC,
                ),
                inputField(
                  title: "Deskripsi",
                  controllerC: controller.deskripsiC,
                ),
                InputStatus(),
                CustomeButton()
              ],
            ),
          ),
        ));
  }
}

class CustomeButton extends GetView<AddKategoriController> {
  const CustomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.addKategori(
          controller.nameC.text,
          controller.deskripsiC.text,
          controller.dropStatus.toString(),
        );
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 15),
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Add Kategori",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )),
    );
  }
}
