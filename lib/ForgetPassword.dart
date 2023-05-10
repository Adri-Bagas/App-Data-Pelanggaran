import 'package:app_data_pelanggaran/Search.dart';
import 'package:app_data_pelanggaran/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formState = GlobalKey<FormState>();
  final EmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
          margin: EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Container(
                width: 350,
                height: 60,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Enter the email associated with your account and the admin will be notified shortly, please contact the admin in 1 or 3 days',
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 400,
          margin: EdgeInsets.all(20),
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
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              fixedSize: Size(400, 57),
            ),
            onPressed: () {
              print('Check your Email');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            child: Text(
              'Send Intructions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ],
    ));
  }
}
