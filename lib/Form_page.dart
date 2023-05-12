import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'models/Siswa.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'models/Url.dart';

class FormPage extends StatefulWidget {
  final Siswa? siswa;

  const FormPage({required this.siswa});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  File? _imageFile = null;

  bool _isLoading = false;

  late var bytes;
  var base64Image = '';
  late String Kelas_id;
  late String Siswa_data;
  String kategoriValue = "";
  String defaultValue = "";
  String keterangan = "";
  late String dataURI;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
    List<int> fileData = await _imageFile!.readAsBytes();
    Uint8List imageData = Uint8List.fromList(fileData);
    List<int> compressedData = await FlutterImageCompress.compressWithList(
      imageData,
      quality: 8,
    );

    base64Image = base64Encode(compressedData);
    dataURI = 'data:image/jpeg;base64,$base64Image';
  }

  // Future<void> _pickImage(ImageSource source) async{
  //   final pickedFile = await ImagePicker().pickImage(source: source);
  //     setState(() {
  //       _imageFile = File(pickedFile!.path);
  //     });
  //
  //   var stream = new http.ByteStream(_imageFile!.openRead());
  //   final fileLength = await _imageFile?.length();
  //
  //
  // }

  Future<List> FetchDataKelasName() async {
    List ListNamaKelas = [];
    String apiURL = '${Urldata.Url}/kelas/show/nama';

    var result = await http.get(Uri.parse(apiURL));
    var dataJson = jsonDecode(result.body);

    for (var item in dataJson) {
      ListNamaKelas.add(
          {"title": '${item['namaKelas']}', "value": '${item['namaKelas']}'});
    }

    return ListNamaKelas;
  }

  List ListSiswaDalamKelas = [];

  void fetchDataSiswaKelas(String kelasNama) async {
    List ListSiswaDalamKela = [];

    String apiURL = '${Urldata.Url}/kelas/show/siswa/${kelasNama}';

    var result = await http.get(Uri.parse(apiURL));
    if (result.statusCode == 200) {
      var dataJson = jsonDecode(result.body)['data_kelas'];

      for (var item in dataJson['Siswas']) {
        ListSiswaDalamKela.add({
          "title": '${item['nama']}',
          "value": '${item['id']}',
        });
      }

      setState(() {
        ListSiswaDalamKelas = ListSiswaDalamKela;
        print(ListSiswaDalamKelas);
      });
    } else {
      print(result.statusCode);
    };
  }

  List NamaKetegoriPelanggaran = [];

  void fetchDataPelanggaran() async {
    String apiURL = '${Urldata.Url}/pelanggaran';

    var result = await http.get(Uri.parse(apiURL));

    if (result.statusCode == 200) {
      var dataJson = jsonDecode(result.body);

      for (var item in dataJson) {
        NamaKetegoriPelanggaran.add(
            {"title": item['jn_pelanggaran'], "value": item['jn_pelanggaran']});
      }

      print(NamaKetegoriPelanggaran);
      setState(() {

      });
    } else {
      AlertDialog(
        title: Text('${result.statusCode}'),
      );
    }
  }

  List listPelanggaran = [];
  void fetchPelanggaranbyKategori(String kategori) async{
    String apiURL = '${Urldata.Url}/pelanggaran/kategori/${kategori}';

    var result = await http.get(Uri.parse(apiURL));

    if(result.statusCode == 200){
      var dataJson = jsonDecode(result.body);

      for(var item in dataJson){
        listPelanggaran.add({
          "title": item['nama_pelanggaran'],
          "value": '${item['id']}',
        });
      }

      print(listPelanggaran);
      setState(() {

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataPelanggaran();
    Kelas_id = widget.siswa != null ? '${widget.siswa!.nama_kelas}' : '';
    Siswa_data = widget.siswa != null ? '${widget.siswa!.id}' : '';
  }

  final _formKey = GlobalKey<FormState>();

  void _submitForm() async {
    if(_formKey.currentState!.validate()){

      setState(() {
        _isLoading = true;
      });

      String SubmitURL = '${Urldata.Url}/pelanggaran/catat';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final jwt = prefs.getString('jwt');
      final response = await http.post(
          Uri.parse(SubmitURL),
          headers: {'Authorization': 'Bearer $jwt'},
          body: {'kelas': Kelas_id, 'siswa': Siswa_data, 'pelanggaran': defaultValue, 'keterangan': keterangan, 'images': dataURI}
      );

      if(response.statusCode == 200){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Column(
              children: [
                Image.asset('assets/images/Success.png', width: 200),
                Text(
                  'Berhasil'
                )
              ],
            ),

          );
        });
      }else{
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text('${response.statusCode}'),
          );
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40
              ),
              child: ListView(
                  children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Kelas',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                FutureBuilder(
                    future: FetchDataKelasName(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (widget.siswa == null) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),),
                                contentPadding: const EdgeInsets.all(20),),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  isDense: true,
                                  value: widget.siswa != null
                                      ? '${widget.siswa!.nama_kelas}'
                                      : Kelas_id,
                                  isExpanded: true,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(widget.siswa != null
                                          ? '${widget.siswa!.nama_kelas}'
                                          : ''),
                                      value: widget.siswa != null
                                          ? '${widget.siswa!.nama_kelas}'
                                          : '',
                                    ),
                                    ...snapshot.data!
                                        .map<DropdownMenuItem<String>>((data) {
                                      return DropdownMenuItem(
                                        child: Text(data['title']),
                                        value: data['value'],
                                      );
                                    }).toList(),
                                  ],
                                  onChanged: widget.siswa != null
                                      ? null
                                      : (value) {
                                          print("selected Value $value");
                                          setState(() {
                                            Kelas_id = value!;
                                            Siswa_data = '';
                                            fetchDataSiswaKelas(value);
                                          });
                                        }),
                            ),
                          );
                        } else {
                          return InputDecorator(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                contentPadding: const EdgeInsets.all(10)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  isDense: true,
                                  value: widget.siswa != null
                                      ? '${widget.siswa!.nama_kelas}'
                                      : Kelas_id,
                                  isExpanded: true,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(widget.siswa != null
                                          ? '${widget.siswa!.nama_kelas}'
                                          : ''),
                                      value: widget.siswa != null
                                          ? '${widget.siswa!.nama_kelas}'
                                          : '',
                                    ),
                                  ],
                                  onChanged: widget.siswa != null
                                      ? null
                                      : (value) {
                                          print("selected Value $value");
                                          setState(() {
                                            Kelas_id = value!;
                                            Siswa_data = '';
                                            fetchDataSiswaKelas(value);
                                          });
                                        }),
                            ),
                          );
                        }
                      } else {
                        return InputDecorator(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              contentPadding: const EdgeInsets.all(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                isDense: true,
                                value: '',
                                isExpanded: true,
                                items: [
                                  const DropdownMenuItem(
                                    child: Text(''),
                                    value: '',
                                  ),
                                ],
                                onChanged: widget.siswa != null
                                    ? null
                                    : (value) {
                                        print("selected Value $value");
                                        setState(() {
                                          Kelas_id = value!;
                                          Siswa_data = '';
                                          fetchDataSiswaKelas(value);
                                        });
                                      }),
                          ),
                        );
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Nama Siswa',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      contentPadding: const EdgeInsets.all(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        isDense: true,
                        value:
                            widget.siswa != null ? '${widget.siswa!.id}' : Siswa_data,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                                widget.siswa != null ? '${widget.siswa!.nama}' : ''),
                            value: widget.siswa != null ? '${widget.siswa!.id}' : '',
                          ),
                          ...ListSiswaDalamKelas.map<DropdownMenuItem<String>>(
                                  (data) {
                                return DropdownMenuItem(
                                  child: Text(data['title']),
                                  value: data['value'],
                                );
                              })?.toList() ??
                              [],
                        ],
                        onChanged: widget.siswa != null
                            ? null
                            : (value) {
                                print("selected Value $value");
                                setState(() {
                                  Siswa_data = value!;
                                });
                              }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Keterangan',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: TextFormField(
                    maxLines: 8,
                    onChanged: (value){
                      keterangan = value;
                    },
                    validator: (value) {
                      if (value == '') {
                        return "Text tidak boleh kosong!";
                      }
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Keterangan',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Gambar',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 150,
                    child: _imageFile != null ?  Image(image: FileImage(_imageFile!)) : Image.network('https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                  ),
                ),
                    const SizedBox(
                      height: 15,
                    ),
                InkWell(
                  onTap: () => _pickImage(ImageSource.camera),
                  child: Container(
                    width: 100.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Camera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Kategori',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        isDense: true,
                        value: kategoriValue,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        items: [
                          const DropdownMenuItem(
                            child: Text(""),
                            value: "",
                          ),
                          ...NamaKetegoriPelanggaran.map<DropdownMenuItem<String>>(
                              (data) {
                            return DropdownMenuItem(
                              child: Text(data['title']),
                              value: data['value'],
                            );
                          }).toList(),
                        ],
                        onChanged: (value) {
                          print("selected Value $value");
                          setState(() {
                            listPelanggaran = [];
                            defaultValue = '';
                            kategoriValue = value!;
                            fetchPelanggaranbyKategori(value);
                          });
                        }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Selected Point',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: defaultValue,
                        isExpanded: true,
                        itemHeight: 75,
                        items: [
                          const DropdownMenuItem(
                            child: Text(""),
                            value: "",
                          ),
                          ...listPelanggaran
                              .map<DropdownMenuItem<String>>((data) {
                            return DropdownMenuItem(
                              child: Text(data['title']),
                              value: data['value'],
                            );
                          }).toList(),
                        ],
                        onChanged: (value) {
                          print("selected Value $value");
                          setState(() {
                            defaultValue = value!;
                          });
                        }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            _isLoading ? Container(
              color: Colors.white.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
