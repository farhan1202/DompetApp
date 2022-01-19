import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allTransaksi.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';
import 'package:mobile_pocket_app/app/modules/main/dompetKeluar/controllers/dompet_keluar_controller.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class CardItemDompetKeluar extends GetView<DompetKeluarController> {
  const CardItemDompetKeluar({
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data[i].kode.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
                Text(data[i].tanggal.toString()),
                Text(
                  data[i].deskripsi.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  data[i].namaKategori.toString() +
                      " - " +
                      data[i].namaDompet.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text((data[i].statusId == "1") ? "Aktif" : "Tidak Aktif"),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.red),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Rp. " + data[i].nilai.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                SubMenuDialog(height: height, data: data, i: i),
              );
            },
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

class SubMenuDialog extends GetView<DompetKeluarController> {
  const SubMenuDialog({
    Key? key,
    required this.height,
    required this.data,
    required this.i,
  }) : super(key: key);

  final double height;
  final List<Datum> data;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height * 0.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SubMenu(
            icon: Icons.edit,
            title: "Edit",
            onTap: () {
              Get.toNamed(
                Routes.EDIT_DOMPET_KELUAR,
                arguments: data[i],
              );
            },
          ),
          Divider(),
          SubMenu(
            icon: data[i].statusId == "1" ? Icons.close : Icons.check,
            title: data[i].statusId == "1" ? "Tidak Aktif" : "Aktif",
            onTap: () {
              controller.editStatDompet(
                data[i].id.toString(),
                data[i].statusId.toString(),
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

class SubMenu extends StatelessWidget {
  const SubMenu({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Text(title,
                style: TextStyle(
                  fontSize: 25,
                )),
          ],
        ),
      ),
    );
  }
}
