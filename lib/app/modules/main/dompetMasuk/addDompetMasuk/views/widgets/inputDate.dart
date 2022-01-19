import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/modules/main/dompetMasuk/addDompetMasuk/controllers/add_dompet_masuk_controller.dart';

class InputDate extends GetView<AddDompetMasukController> {
  const InputDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          GestureDetector(
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2030))
                  .then((value) {
                var data =
                    "${value!.year.toString()}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
                controller.dateSlug.value = data;
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              margin: const EdgeInsets.symmetric(vertical: 10),
              // height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 15),
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Obx(() => Text(controller.dateSlug.value)),
            ),
          )
        ],
      ),
    );
  }
}
