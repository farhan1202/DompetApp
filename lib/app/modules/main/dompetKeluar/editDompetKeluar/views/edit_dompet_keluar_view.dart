import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';

import '../controllers/edit_dompet_keluar_controller.dart';
import 'widgets/inputDate.dart';
import 'widgets/inputDompet.dart';
import 'widgets/inputField.dart';
import 'widgets/inputKategori.dart';
import 'widgets/inputStatus.dart';

class EditDompetKeluarView extends GetView<EditDompetKeluarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const InputDate(),
              inputField(
                title: "Deskripsi",
                controllerC: controller.deskripsiC,
              ),
              const InputKategori(),
              const InputDompet(),
              inputField(
                title: "Nilai",
                controllerC: controller.nilaiC,
                tipe: TextInputType.number,
              ),
              const InputStatus(),
              const CustomeButton()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeButton extends GetView<EditDompetKeluarController> {
  const CustomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.editDompetMasuk(
          controller.deskripsiC.text,
          (controller.nilaiC.text.isEmpty) ? "0" : controller.nilaiC.text,
          controller.dropStatus.value,
          controller.dropDompet.value,
          controller.dropKategori.value,
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
          child: const Center(
            child: Text(
              "Edit Dompet Masuk",
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
