import 'package:get/get.dart';
import 'package:mobile_pocket_app/app/data/models/Status.dart';
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

  Future<Status?> getAllStatus() async {
    final respone = await get(dUrl + "getStatTransaksi.php");

    Status status;
    status = Status.fromJson(respone.body);
    if (status.data == null) {
      return null;
    }

    return status;
  }

  Future<Response> addTransaksi(
    String deskripsi,
    String nilai,
    String tanggal,
    String statusId,
    String dompetId,
    String kategoriId,
    String transaksiId,
  ) {
    final form = FormData(
      {
        'deskripsi': deskripsi,
        'nilai': nilai,
        'tanggal': tanggal,
        'status_id': statusId,
        'dompet_id': dompetId,
        'kategori_id': kategoriId,
        'transaksi_id': transaksiId,
      },
    );

    return post(dUrl + 'transaksi.php', form);
  }

  Future<Response> editTransaksi(
    String id,
    String deskripsi,
    String nilai,
    String statusId,
    String dompetId,
    String kategoriId,
  ) {
    final form = FormData(
      {
        'id': id,
        'deskripsi': deskripsi,
        'nilai': nilai,
        'status_id': statusId,
        'dompet_id': dompetId,
        'kategori_id': kategoriId,
      },
    );

    return post(dUrl + 'editTransaksi.php', form);
  }
}
