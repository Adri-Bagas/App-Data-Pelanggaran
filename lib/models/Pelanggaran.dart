import 'package:http/http.dart' as http;
import 'dart:convert';

class Pelanggaran {
  late int? id;
  late String? nama_pelanggaran;
  late String? ket_pelanggaran;
  late int? poin;
  late String? jn_pelanggaran;
}

Future<List<Pelanggaran>> fetchDataPelanggaranAll() async {
  List<Pelanggaran> Pelanggarans = [];

  String apiURL = "http://localhost:3000/siswas/show/all";
  var result = await http.get(Uri.parse(apiURL));
  var dataJson = json.decode(result.body);

  for (var item in dataJson){
    Pelanggaran pelanggran = Pelanggaran();
    pelanggran.id = item['id'];
    pelanggran.nama_pelanggaran = item['nama_pelanggaran'];
    pelanggran.ket_pelanggaran = item['ket_pelanggaran'];
    pelanggran.poin = item['poin'];
    pelanggran.jn_pelanggaran = item['jn_pelanggaran'];

    Pelanggarans.add(pelanggran);
  }

  return Pelanggarans;
}