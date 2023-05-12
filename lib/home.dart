import 'package:app_data_pelanggaran/Search.dart';
import 'package:app_data_pelanggaran/Setting.dart';
import 'package:flutter/material.dart';

import 'Form_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _PageIndex = 0;

  List _Pages = [
    HomePage(),
    SearchPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages[_PageIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(25, 20, 25, 30),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 30,
                blurStyle: BlurStyle.outer,
                color: Colors.black87
            ),
          ],
        ),
        child: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _PageIndex = 0;
                });
              },
              icon: const Icon(
                Icons.home,
                size: 27,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(
                Icons.search,
                size: 27,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _PageIndex = 2;
                });
              },
              icon: const Icon(
                Icons.settings,
                size: 27,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -350,
          left: -200,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [
                Colors.blueAccent,
                Colors.white,
              ], radius: 0.5),
            ),
            height: 500,
            width: 500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  text: "Hello, ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Ubuntu",
                      fontSize: 24),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'How are you!',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/Logoprojek.png",
                  height: 70,
                  width: 70,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
          width: double.infinity,
          height: 700,
          color: Colors.transparent,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const RadialGradient(
                      colors: [
                        Colors.blueAccent,
                        Colors.lightBlueAccent,
                      ],
                      radius: 1.2,
                      center: Alignment(-1, -1),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>FormPage(siswa: null))
                      );
                    },
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 30,
                          left: 30,
                          child: Text(
                            "Catat \nPelanggaran!",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "Ubuntu"),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Image.asset(
                            "assets/images/ANjing.png",
                            width: 300,
                            height: 300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 30,
                    child: Container(
                      child: const Text(
                        "Find Your \nStuff Here!",
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/Data/Kelas');
                              },
                              child: Container(
                                margin:
                                const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const RadialGradient(
                                    colors: [Colors.redAccent, Colors.pink],
                                    radius: 1.2,
                                    center: Alignment(-1, -1),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text(
                                        "Daftar Kelas",
                                        style: TextStyle(
                                          fontFamily: "Ubuntu",
                                          fontSize: 24,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -30,
                                      bottom: 10,
                                      child: Image.asset('assets/images/Siswa.png', width: 150),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                showSearch(context: context, delegate: DataSearch());
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const RadialGradient(
                                    colors: [Colors.blueAccent, Colors.indigo],
                                    radius: 1.2,
                                    center: Alignment(-1, -1),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text(
                                        "Cari Siswa",
                                        style: TextStyle(
                                          fontFamily: "Ubuntu",
                                          fontSize: 24,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -30,
                                      bottom: -150,
                                      child: Image.asset('assets/images/indian.png', width: 150),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/Data/Pelanggaran');
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const RadialGradient(
                                    colors: [Colors.lightBlueAccent, Colors.indigoAccent],
                                    radius: 1.2,
                                    center: Alignment(-1, -1),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text(
                                        "Data Peraturan",
                                        style: TextStyle(
                                            fontFamily: "Ubuntu",
                                            fontSize: 20,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -30,
                                      bottom: -70,
                                      child: Image.asset('assets/images/Check.png', width: 150),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

