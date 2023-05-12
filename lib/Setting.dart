import 'package:app_data_pelanggaran/Search.dart';
import 'package:app_data_pelanggaran/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _formState = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchUserData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Scaffold(
              backgroundColor: Color(0xffF9F9F9),
              body: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 30),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Your account',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 400,
                          height: 150,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${snapshot.data!.name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${snapshot.data!.email}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Your account',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 400,
                        height: 50,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(
                          top: 25 / 2,
                          left: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          'Help ?',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 400,
                        height: 50,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(
                          top: 25 / 2,
                          left: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          'About',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFF0404),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          fixedSize: Size(400, 60),
                        ),
                        onPressed: () async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.remove('jwt');
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            );
          } else {
            return AlertDialog(
              title: CircularProgressIndicator(),
            );
          }


        }
    );
  }
}
