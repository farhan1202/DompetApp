import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';

import '../controllers/add_dompet_masuk_controller.dart';
import 'widgets/inputDompet.dart';
import 'widgets/inputField.dart';
import 'widgets/inputKategori.dart';
import 'widgets/inputStatus.dart';

class AddDompetMasukView extends GetView<AddDompetMasukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Dompet Masuk'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              inputField(
                title: "Deskripsi",
                controllerC: controller.deskripsiC,
              ),
              InputKategori(),
              InputDompet(),
              inputField(
                title: "Nilai",
                controllerC: controller.nilaiC,
                tipe: TextInputType.number,
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

class CustomeButton extends GetView<AddDompetMasukController> {
  const CustomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              "Add Dompet Masuk",
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
