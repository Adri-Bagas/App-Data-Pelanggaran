import 'package:app_data_pelanggaran/KelasListScreen.dart';
import 'package:app_data_pelanggaran/Search.dart';
import 'package:app_data_pelanggaran/SignUp.dart';
import 'package:app_data_pelanggaran/login_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import './introscreen.dart';
import './home.dart';
import 'PelanggaranListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(
              splash: Image.asset('assets/images/Logoprojek.png'),
              splashIconSize: 400,
              duration: 3000,
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              nextScreen: IntroScreen(),
            ),
        '/login': (context) => LoginPage(),
        '/signup': (context) => const SignUp(),
        '/introScreen': (context) => const IntroScreen(),
        '/Search': (context) => const SearchPage(),
        '/Home': (context) => const HomeScreen(),
        '/Data/Kelas': (context) => KelasListScreen(),
        '/Data/Pelanggaran': (context) => PelanggaranScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


// class TestScreenForList extends StatefulWidget {
//   const TestScreenForList({Key? key}) : super(key: key);
//
//   @override
//   State<TestScreenForList> createState() => _TestScreenForListState();
// }
//
// class _TestScreenForListState extends State<TestScreenForList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Kelas>>(
//         future: fetchDataKelasWithSiswaAll(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 Kelas kelas = snapshot.data![index];
//                 return ExpansionTile(
//                   title: Text(kelas.namaKelas),
//                   subtitle: Text('${kelas.id}'),
//                   children: [
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: ClampingScrollPhysics(),
//                       itemCount: kelas.Siswas.length,
//                       itemBuilder: (context, index) {
//                         Siswa siswa = kelas.Siswas[index];
//                         return ListTile(
//                           title: Text(siswa.nama),
//                           subtitle: Text('${siswa.id}'),
//                         );
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('${snapshot.error}'));
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }

// class _TestScreenForListState extends StatefulWidget {
//   const _TestScreenForListState({Key? key}) : super(key: key);
//
//   @override
//   State<_TestScreenForListState> createState() =>
//       _TestScreenForListStateState();
// }

// class _TestScreenForListStateState extends State<_TestScreenForListState> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Kelas>>(
//         future: fetchDataKelasWithSiswaAll(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 Kelas kelas = snapshot.data![index];
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => KelasListScreen(),
//                       ),
//                     );
//                   },
//                   child: ListTile(
//                     title: Text(kelas.namaKelas),
//                     subtitle: Text('${kelas.id}'),
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('${snapshot.error}'));
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }