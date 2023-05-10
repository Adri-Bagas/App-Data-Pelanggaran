import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class User{
  late String id;
  late String name;
  late String email;
  late String level;
}

Future<bool> checkAccountOnLogin(String email, String password) async {

  String LoginURL = 'http://localhost:3000/users/login';

  final response = await http.post(
    Uri.parse(LoginURL),
    body: {'email': email, 'password': password},
  );
  if (response.statusCode == 200) {
    final token = jsonDecode(response.body)['token'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', token);
    return true;
  }else{
    return false;
  }
}





