import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/allTransaksi.dart';
import 'package:mobile_pocket_app/app/data/utils/constanta.dart';

class TransaksiProvider extends GetConnect {
  Future<Transaksi?> getAllKategori(String transaksiid) async {
    final form = FormData(
      {
        'transaksi_id': transaksiid,
      },
    );
    final respone = await post(dUrl + "getTransaksi.php", form);

    Transaksi transaksi;
    transaksi = Transaksi.fromJson(respone.body);
    if (transaksi.data == null) {
      return null;
    }

    return transaksi;
  }

  /// Fungsi yang digunakan untuk merubah status dari akttif menjadi tidak aktif, begitu sebaliknya
  /// request berupa [id][status_id]
  Future<Response> editStat(String id, String statusid) {
    final form = FormData(
      {
        'id': id,
        'status_id': statusid,
      },
    );

    return post(dUrl + 'ubahStatusDompetMasuk.php', form);
  }
}
