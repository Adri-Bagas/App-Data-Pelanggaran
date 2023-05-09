import 'package:app_data_pelanggaran/SignUp.dart';
import 'package:app_data_pelanggaran/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: -50,
              child: Container(
                width: 260,
                height: 260,
                padding: EdgeInsets.only(
                  top: 45,
                  bottom: 45,
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(217, 217, 217, 217),
                    shape: BoxShape.circle),
                child: Image(
                  image: AssetImage('assets/images/maskotb.png'),
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: -180,
              child: Container(
                width: 400,
                height: 400,
                padding: EdgeInsets.only(
                  left: 125,
                  top: 45,
                  bottom: 45,
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(217, 217, 217, 217),
                    shape: BoxShape.circle),
                child: Image(
                  image: AssetImage(
                    'assets/images/mascotb.png',
                  ),
                ),
              ),
            ),
            Positioned(
                child: Container(
              width: 125,
              margin: EdgeInsets.fromLTRB(250, 100, 0, 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFF0404),
              ),
            )),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 30,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Welcome to',
                        style: TextStyle(fontSize: 15, fontFamily: "Poppins"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 150, top: 10),
                      child: Text(
                        'Applications',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 50,
                        color: Color.fromARGB(0, 33, 34, 35),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26))),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return LoginPage();
                                }),
                              );
                            },
                            child: Text(
                              'Get started',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Poppins"),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
