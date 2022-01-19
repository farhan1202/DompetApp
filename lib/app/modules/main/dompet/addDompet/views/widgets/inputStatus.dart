import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/Status.dart';
import 'package:mobile_pocket_app/app/modules/main/dompet/addDompet/controllers/add_dompet_controller.dart';

class InputStatus extends GetView<AddDompetController> {
  const InputStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Status",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 54,
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
            // child: Obx(
            //   () => DropdownButtonHideUnderline(
            //     child: DropdownButton<String>(
            //         value: controller.dropStatus.value.toString(),
            //         isExpanded: true,
            //         items: controller.items.map(buildMenuItem).toList(),
            //         onChanged: (value) =>
            //             controller.dropStatus.value = value!),
            //   ),
            // ))
            child: DropdownSearch<Datum>(
              mode: Mode.MENU,
              onFind: (text) {
                var data = controller.getDataStatus();
                return data;
              },
              hint: "Status",
              itemAsString: (item) => "${item!.nama}",
              onChanged: (value) {
                controller.dropStatus.value = value!.nama.toString();
              },
              dropdownSearchDecoration:
                  InputDecoration(border: InputBorder.none),
              popupItemBuilder: (context, item, isSelected) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    "${item.nama}",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// DropdownMenuItem<String> buildMenuItem(String item) =>
//     DropdownMenuItem(value: item, child: Text(item));
