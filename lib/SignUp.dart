import 'package:app_data_pelanggaran/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 100, bottom: 80),
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  'Get Started',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Create your account Now',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
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
                        'Log in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
