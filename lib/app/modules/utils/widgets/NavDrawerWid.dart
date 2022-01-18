import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';
import 'package:mobile_pocket_app/app/routes/app_pages.dart';

class NavBarDrawer extends StatelessWidget {
  const NavBarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: kPrimaryColor,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    "MASTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  buildMenuItem(
                    icon: Icons.account_balance_wallet,
                    title: "Dompet",
                    onClicked: () {
                      Get.toNamed(Routes.DOMPET);
                    },
                  ),
                  buildMenuItem(
                    icon: Icons.category,
                    title: "Kategory",
                    onClicked: () {
                      Get.toNamed(Routes.KATEGORI);
                    },
                  ),
                  Divider(color: Colors.white70),
                  const Text(
                    "Transaksi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  buildMenuItem(icon: Icons.input, title: "Dompet Masuk"),
                  buildMenuItem(icon: Icons.outbond, title: "Dompet Keluar"),
                  Divider(color: Colors.white70),
                  const Text(
                    "Laporan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  buildMenuItem(icon: Icons.report, title: "Laporan Transaksi"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile buildMenuItem({
    required String title,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      hoverColor: Colors.white70,
      onTap: onClicked,
    );
  }
}
