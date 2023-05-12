import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'Url.dart';

class User{
  String? id;
  String? name;
  String? email;
  String? level;
}

Future<bool> checkAccountOnLogin(String email, String password) async {

  String LoginURL = '${Urldata.Url}/users/login';

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

Future<User> fetchUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final jwt = prefs.getString('jwt');
  final response = await http.get(
    Uri.parse('${Urldata.Url}/users/user-data'),
    headers: {'Authorization': 'Bearer $jwt'},
  );
  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    User datas = User();

    datas.email = userData['email'];
    datas.name = userData['name'];

    print(datas);
    return datas;
  } else {
    return User();
  }
}





