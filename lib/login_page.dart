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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 70),
            child: Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),

          //username textfield
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

          const SizedBox(height: 10),

          //password textfield
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
                  border: OutlineInputBorder(), label: Text('Password')),
            ),
          ),

          const SizedBox(height: 10),

          //forgot pass?
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(
                  'Forgot Password?',
                style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
       const SizedBox(height: 10),

          //sign in button
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
                      },
                      child: Text('Sign in'),
                    ),
                  ),

          const SizedBox(height: 50),

          //or continue with
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
          ),

          const SizedBox(height: 50),

          //google apple sign in buttons
         GestureDetector(
            onTap: () {
              // tambahkan logika yang ingin dilakukan ketika user melakukan tap pada widget ini
              print('Container with image is tapped!');
            },
            child: Container(
              margin: EdgeInsets.only(top: 35),
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 179, 179, 179), width: 1),
              ),
              child: Image(
                image: AssetImage('lib/images/google.png'),
                width: 15,
                height: 15,
              ),
            ),
          ),

          //not a member? regist now
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
