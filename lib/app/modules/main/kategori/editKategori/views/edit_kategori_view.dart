import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';
import 'package:mobile_pocket_app/app/modules/main/kategori/editKategori/views/widgets/inputField.dart';

import '../controllers/edit_kategori_controller.dart';
import 'widgets/inputStatus.dart';

class EditKategoriView extends GetView<EditKategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kategori'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InputField(
                title: "Name",
                controllerC: controller.nameC,
              ),
              InputField(
                title: "Deskripsi",
                controllerC: controller.deskripsiC,
              ),
              InputStatus(),
              CustomeButton()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeButton extends GetView<EditKategoriController> {
  const CustomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.editKategori(
          controller.nameC.text,
          controller.deskripsiC.text,
          controller.dropStatus.value,
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
              "Edit Data",
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
