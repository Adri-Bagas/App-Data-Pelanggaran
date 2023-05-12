import 'package:flutter/material.dart';
import 'Form_page.dart';
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

              late List<Widget> WidgetForColumn = [];

              if (siswa.pelanggarans != null) {
                for (var item in siswa.pelanggarans ?? []) {
                  WidgetForColumn.add(
                    ListTile(
                      title: Text('${item.pelanggaran.nama_pelanggaran}'),
                      subtitle: Text('${item.Guru}'),
                      trailing: Text('${item.pelanggaran.poin}'),
                    ),
                  );
                  WidgetForColumn.add(Divider());
                }
              }

              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Row(
                            children: [
                              Spacer(
                                flex: 1,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back)),
                              Spacer(
                                flex: 4,
                              ),
                              Text('data siswa'),
                              Spacer(
                                flex: 6,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          width: 160,
                          height: 200,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            '${siswa.nama}',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 5,
                          ),
                          child: Text(
                            '${siswa.nama_kelas}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            'POINT',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
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
                                BoxShadow(
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
                              '${siswa.poin_tot}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20
                          ),
                          width: 200,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>FormPage(siswa: siswa))
                              );
                            },
                            child: Text('Catat Pelanggaran', style: TextStyle(
                              fontSize: 20
                            ),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          padding:
                              EdgeInsets.only(left: 2, right: 2, bottom: 5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 2))),
                          child: Text(
                            'Riwayat Pelanggaran',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                          child: Column(children: WidgetForColumn),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

