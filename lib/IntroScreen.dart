import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:signup/SignUp.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 120,
            right: -40,
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
            top: 300,
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
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 700),
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
                  color: Color(0x0085FF),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26))),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SignUp();
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
          )
        ],
      ),
    );
  }
}
