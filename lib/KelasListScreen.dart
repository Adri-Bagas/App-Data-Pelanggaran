import 'package:flutter/material.dart';

import 'DetailKelas.dart';
import 'models/Kelas.dart';

class KelasListScreen extends StatefulWidget {
  const KelasListScreen({Key? key}) : super(key: key);

  @override
  State<KelasListScreen> createState() => _KelasListScreenState();
}

class _KelasListScreenState extends State<KelasListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const Spacer(
                      flex: 4,
                    ),
                    const Text('data kelas'),
                    const Spacer(
                      flex: 6,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  'List Kelas',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                ),
                child: const Text(
                  'Jumlah Kelas',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 60,
                  right: 60,
                ),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      ),
                    ]),
                child: Center(
                  child: Text(
                    '0',
                    style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(left: 2, right: 2, bottom: 5),
                decoration: const BoxDecoration(
                    border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
                child: const Text(
                  'Daftar Kelas',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                  height: 300,
                  margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: FutureBuilder(
                    future: fetchDataKelasWithSiswaAll(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            Kelas kelas = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(kelas: kelas),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(kelas.namaKelas),
                                subtitle: Text('${kelas.Siswas.length}'),

                              ),
                            );
                          },
                        );
                      }else if(snapshot.hasError){
                        return AlertDialog(
                          title: Text('${snapshot.error}'),
                        );
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                // ListView.builder(
                //   itemCount: kelas.Siswas.length,
                //   itemBuilder: (context, index) {
                //     Siswa siswa = kelas.Siswas[index];
                //     return GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => SiswaDetailScreen(siswa: siswa),
                //           ),
                //         );
                //       },
                //       child: ListTile(
                //         title: Text(siswa.nama),
                //         subtitle: const Text('Keterangan'),
                //         trailing: const Icon(Icons.more_vert),
                //       ),
                //     );
                //   },
                // ),
              ),
            ],
          ),
        ));
  }
}