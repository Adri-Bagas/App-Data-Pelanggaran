import 'package:app_data_pelanggaran/Search.dart';
import 'package:app_data_pelanggaran/login_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formState = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 100, bottom: 80, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Started',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 15),
                Text(
                  'Create your account Now',
                  style: TextStyle(fontSize: 15),
                ),
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
                      controller: nameController,
                      validator: (value) {
                        if (value == '') {
                          return "Text tidak boleh kosong!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text('Name')),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    margin: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == '') {
                          return "Text tidak boleh kosong!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text('Email')),
                    ),
                  ),
                  SizedBox(height: 20),
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
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Password')),
                    ),
                  ),
                  SizedBox(height: 20),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchPage();
                          }));
                        }
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
