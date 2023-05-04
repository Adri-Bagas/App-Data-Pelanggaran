import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:signup/IntroScreen.dart';
import 'package:signup/Search.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formState = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 70, bottom: 70),
            child: Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ),
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
                      controller: NameController,
                      validator: (value) {
                        if (value == '') {
                          return "Text tidak boleh kosong!";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text('Name')),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                          border: OutlineInputBorder(), label: Text('Email')),
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
                  // Container(
                  //     margin: EdgeInsets.fromLTRB(40, 40, 0, 0),
                  //     child: SizedBox(height: 10)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 60, 0, 0),
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

                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // tambahkan logika yang ingin dilakukan ketika user melakukan tap pada widget ini
              print('Container with image is tapped!');
            },
            child: Container(
              margin: EdgeInsets.only(top: 35),
              width: 120,
              height: 40,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 179, 179, 179), width: 1),
              ),
              child: Image(
                image: AssetImage('assets/images/google.png'),
                width: 15,
                height: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
