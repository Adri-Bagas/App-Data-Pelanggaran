import 'package:http/http.dart' as http;
import 'dart:convert';

class Siswa {
  late int id;
  late String nama;
}

  Future<List<Siswa>> fetchDataSiswaAll() async {
  List<Siswa> Siswas = [];

  String apiURL = "http://localhost:3000/siswas/show/all";
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