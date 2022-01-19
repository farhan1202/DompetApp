import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/modules/main/dompetKeluar/editDompetKeluar/controllers/edit_dompet_keluar_controller.dart';

class InputDate extends GetView<EditDompetKeluarController> {
  const InputDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(17),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: boxDec(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kode",
                  style: defStyle(),
                ),
                Text(
                  controller.data.kode.toString(),
                  style: defStyle(),
                ),
              ],
            ),
          ),
          Text(
            "Date",
            style: defStyle(),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(17),
            margin: const EdgeInsets.symmetric(vertical: 10),
            // height: 54,
            decoration: boxDec(),
            child: Text(controller.data.tanggal.toString()),
          )
        ],
      ),
    );
  }

  TextStyle defStyle() => TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

  BoxDecoration boxDec() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset(0, 15),
          color: Colors.black.withOpacity(0.1),
        ),
      ],
    );
  }
}
