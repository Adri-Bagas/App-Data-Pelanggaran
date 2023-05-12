import 'package:app_data_pelanggaran/models/Pelanggaran.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Record_Pelanggaran.dart';
import 'Url.dart';

class Siswa {
  late int id;
  late String nama;
  late List<Record_Pelanggaran>? pelanggarans;
  late int? poin_tot;
  late String? nama_kelas;
}

Future<List<Siswa>> fetchDataSiswaAll() async {
  List<Siswa> Siswas = [];

  String apiURL = "${Urldata.Url}/siswas/show/all";
  var result = await http.get(Uri.parse(apiURL));
  var dataJson = json.decode(result.body);

  for (var item in dataJson){
    Siswa siswa = Siswa();
    siswa.id = item['id'];
    siswa.nama = item['nama'];

    Siswas.add(siswa);
  }

  return Siswas;
}


Future<List<Siswa>> fetchDataSiswabyName(String query) async {
  List<Siswa> Siswas = [];

  String apiURL = "${Urldata.Url}/siswas/show/all/$query";
  var result = await http.get(Uri.parse(apiURL));
  var dataJson = json.decode(result.body);

  for (var item in dataJson){
    Siswa siswa = Siswa();
    siswa.id = item['id'];
    siswa.nama = item['nama'];

    Siswas.add(siswa);
  }

  return Siswas;
}

Future<Siswa> fetchDataSiswa(int id) async {

  String apiURL = "${Urldata.Url}/siswas/show/$id";
  var result = await http.get(Uri.parse(apiURL));
  var dataJson = json.decode(result.body)['data'];

  Siswa siswa = Siswa();

    siswa.id = dataJson['siswa']['id'];
    siswa.nama = dataJson['siswa']['nama'];
    siswa.nama_kelas = dataJson['siswa']['Kela']['namaKelas'];

    List<Record_Pelanggaran> records = [];
    for (var item2 in dataJson['pelanggaran']){
      Record_Pelanggaran record = Record_Pelanggaran();
      Pelanggaran pelanggaran = Pelanggaran();

      pelanggaran.id = item2['id'];
      pelanggaran.nama_pelanggaran = item2['nama_pelanggaran'];
      pelanggaran.ket_pelanggaran = item2['ket_pelanggaran'];
      pelanggaran.jn_pelanggaran = item2['jn_pelanggaran'];
      pelanggaran.poin = item2['poin'];

      record.pelanggaran = pelanggaran;
      record.img = item2['img_record'];
      record.Guru = item2['penindak'];
      record.keterangan = item2['ket_penindak'];

      records.add(record);
    }

    siswa.poin_tot = dataJson['sum_poin'];
    siswa.pelanggarans = records;

    print(siswa);

  return siswa;
}