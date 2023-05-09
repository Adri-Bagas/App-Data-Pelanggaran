import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_data_pelanggaran/login_page.dart';
import 'package:flutter/material.dart';
import './SignUp.dart';
import './introscreen.dart';
import './models/Siswa.dart';
import './models/Kelas.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(
          splash: Icons.star,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          nextScreen: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/introScreen': (context) => IntroScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestScreenForList extends StatefulWidget {
  const TestScreenForList({Key? key}) : super(key: key);

  @override
  State<TestScreenForList> createState() => _TestScreenForListState();
}

class _TestScreenForListState extends State<TestScreenForList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Kelas>>(
        future: fetchDataKelasWithSiswaAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Kelas kelas = snapshot.data![index];
                return ExpansionTile(
                  title: Text(kelas.namaKelas),
                  subtitle: Text('${kelas.id}'),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: kelas.Siswas.length,
                      itemBuilder: (context, index) {
                        Siswa siswa = kelas.Siswas[index];
                        return ListTile(
                          title: Text(siswa.nama),
                          subtitle: Text('${siswa.id}'),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

