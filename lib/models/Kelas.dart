import 'package:http/http.dart' as http;
import 'dart:convert';
import './Siswa.dart';
import './Url.dart';


class Kelas {
  late int id;
  late String namaKelas;
  late String Walas;
  late List<Siswa> Siswas;
}

Future<List<Kelas>> fetchDataKelasWithSiswaAll() async{
  List<Kelas> Kelases = [];

  String apiURL = "${Urldata.Url}/kelas/";

  var result = await http.get(Uri.parse(apiURL));
  var dataJson = json.decode(result.body);

  print(dataJson);

  for (var item in dataJson){

    Kelas kelas = Kelas();
    kelas.id = item['id'];
    kelas.namaKelas = item['namaKelas'];
    kelas.Walas = item['User']['name'];

    List<Siswa> Siswas = [];
    for (var item2 in item['Siswas']){
      Siswa siswa = Siswa();
      siswa.id = item2['id'];
      siswa.nama = item2['nama'];
      Siswas.add(siswa);
    }
    kelas.Siswas = Siswas;

    Kelases.add(kelas);
  }

  for (var kelas in Kelases) {
    print("Kelas: ${kelas.namaKelas}");
    print("Walas: ${kelas.Walas}");
    print("Siswas: ");
    for (var siswa in kelas.Siswas) {
      print("- ${siswa.nama}");
    }
  }

  return Kelases;
}


