import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allDompet.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';
import 'package:mobile_pocket_app/app/modules/main/dompet/controllers/dompet_controller.dart';

class CardItemDompet extends GetView<DompetController> {
  const CardItemDompet({
    Key? key,
    required this.i,
    required this.height,
    required this.data,
  }) : super(key: key);

  final double height;
  final int i;
  final List<Datum> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              blurRadius: 15,
              offset: Offset(0, 10),
              color: Colors.black.withOpacity(0.1))
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kPrimaryColor,
            radius: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data[i].nama.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(data[i].referensi.toString()),
              Text(data[i].deskripsi.toString()),
              Text((data[i].statusId == "1") ? "Aktif" : "Tidak Aktif"),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_drop_down_circle_rounded,
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
