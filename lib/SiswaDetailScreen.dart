import 'package:flutter/material.dart';

import 'models/Siswa.dart';

class SiswaDetailScreen extends StatefulWidget {

  final Siswa siswa;

  SiswaDetailScreen({required this.siswa});

  @override
  State<SiswaDetailScreen> createState() => _SiswaDetailScreenState();
}

class _SiswaDetailScreenState extends State<SiswaDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchDataSiswa(widget.siswa.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Siswa siswa = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Back'),),
                    SizedBox(height: 16.0),
                    Text('ID: ${siswa.id}'),
                    SizedBox(height: 8.0),
                    Text('Nama: ${siswa.nama}'),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
