import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List dropDownListDataKelas = [
    {"tittle": "A", "value": "1"},
    {"tittle": "B", "value": "2"},
    {"tittle": "C", "value": "3"},
    {"tittle": "D", "value": "4"},
    {"tittle": "E", "value": "5"},
  ];
  List dropDownListDataNama = [
    {"tittle": "A", "value": "1"},
    {"tittle": "B", "value": "2"},
    {"tittle": "C", "value": "3"},
    {"tittle": "D", "value": "4"},
    {"tittle": "E", "value": "5"},
  ];

  final _formState = GlobalKey<FormState>();
  final KategoriController = TextEditingController();
  final FotoController = TextEditingController();

  String defaultValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      child: ListView(children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Kelas',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        InputDecorator(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: EdgeInsets.all(10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                isDense: true,
                value: defaultValue,
                isExpanded: true,
                menuMaxHeight: 350,
                items: [
                  const DropdownMenuItem(
                    child: Text("Kelas"),
                    value: "",
                  ),
                  ...dropDownListDataKelas
                      .map<DropdownMenuItem<String>>((data) {
                    return DropdownMenuItem(
                      child: Text(data['tittle']),
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
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Nama Siswa',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        InputDecorator(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: EdgeInsets.all(10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                isDense: true,
                value: defaultValue,
                isExpanded: true,
                menuMaxHeight: 350,
                items: [
                  const DropdownMenuItem(
                    child: Text("Nama Siswa"),
                    value: "",
                  ),
                  ...dropDownListDataNama.map<DropdownMenuItem<String>>((data) {
                    return DropdownMenuItem(
                      child: Text(data['tittle']),
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
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Keterangan',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 62,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Keterangan',
                hintStyle: TextStyle(color: Colors.grey[500])),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Gambar',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 62,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Gambar',
                hintStyle: TextStyle(color: Colors.grey[500]),
                contentPadding: EdgeInsets.only(top: 30, left: 15)),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Kategori',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        InputDecorator(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: EdgeInsets.all(10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                isDense: true,
                value: defaultValue,
                isExpanded: true,
                menuMaxHeight: 350,
                items: [
                  const DropdownMenuItem(
                    child: Text("Kategori"),
                    value: "",
                  ),
                  ...dropDownListDataNama.map<DropdownMenuItem<String>>((data) {
                    return DropdownMenuItem(
                      child: Text(data['tittle']),
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
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Selected Point',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        InputDecorator(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 120, 0)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                isDense: true,
                value: defaultValue,
                isExpanded: true,
                items: [
                  const DropdownMenuItem(
                    child: Text("Select Point"),
                    value: "",
                  ),
                  ...dropDownListDataNama.map<DropdownMenuItem<String>>((data) {
                    return DropdownMenuItem(
                      child: Text(data['tittle']),
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
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
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
      ]),
    ));
  }
}
