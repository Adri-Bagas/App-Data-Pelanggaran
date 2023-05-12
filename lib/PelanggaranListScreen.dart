import 'package:app_data_pelanggaran/models/Pelanggaran.dart';
import 'package:flutter/material.dart';

class PelanggaranScreen extends StatefulWidget {
  const PelanggaranScreen({Key? key}) : super(key: key);

  @override
  State<PelanggaranScreen> createState() => _PelanggaranScreenState();
}

class _PelanggaranScreenState extends State<PelanggaranScreen> {
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
                    const Text('data palanggaran'),
                    const Spacer(
                      flex: 6,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(left: 2, right: 2, bottom: 5),
                decoration: const BoxDecoration(
                    border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
                child: const Text(
                  'Daftar pelanggaran',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 165,
                margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: FutureBuilder(
                  future: fetchDataPelanggaranAll(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          Pelanggaran pelanggaran = snapshot.data![index];
                          return InkWell(
                            child: ListTile(
                              title: Text(pelanggaran.nama_pelanggaran!),
                              subtitle: Text('${pelanggaran.jn_pelanggaran!} - ${pelanggaran.poin}'),
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
                ),
              ),
            ],
          ),
        ));
  }
}