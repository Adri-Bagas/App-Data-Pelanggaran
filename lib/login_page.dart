import 'package:app_data_pelanggaran/ForgetPassword.dart';
import 'package:app_data_pelanggaran/Search.dart';
import 'package:app_data_pelanggaran/SignUp.dart';
import 'package:flutter/material.dart';
import 'components/my__button.dart';
import 'components/my_textfield.dart';
import 'components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controller
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formState = GlobalKey<FormState>();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: -400,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                Colors.blue,
                Colors.white,
              ], radius: 0.7)),
            ),
          ),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 80, bottom: 20),
                  width: 250,
                  height: 250,
                  child:
                      Image(image: AssetImage('assets/images/Logoprojek.png'))),
              Container(
                margin: EdgeInsets.all(15),
                child: Form(
                  key: _formState,
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: EmailController,
                          validator: (value) {
                            if (value == '') {
                              return "Text tidak boleh kosong!";
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Email')),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 400,
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value == '') {
                              return "Text tidak boleh kosong!";
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Password')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgetPassword();
                                }));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            fixedSize: Size(400, 57),
                          ),
                          onPressed: () {
                            if (_formState.currentState!.validate()) {
                              // Do something
                            } else {}
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SearchPage();
                            }));
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //not a member? regist now
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUp();
                        }));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
