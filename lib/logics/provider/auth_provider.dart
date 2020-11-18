import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:login_register_app/logics/services/message.dart';
import 'package:login_register_app/utils/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {

  String _token;
  String _userName;
  String _emailId;

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  String get emailId {
    return _emailId;
  }

  String get userName {
    return _userName;
  }



  bool get isAuth {
    return token != null;
  }

  Future<bool> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    final userData =
        json.encode(prefs.getString('userData')) as Map<String, Object>;
    print(userData);
   _emailId = userData['email'];
   _userName = userData['name'];
   _token = userData['user-token'];
   notifyListeners();
    return true;
  }

  void logout() async {
    _emailId = null;
    _userName = null;
    _token = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> register(String email, String name, String password) async {
    try {
      var result;
      final response = await http.post(AppUrl.register,
          body: json
              .encode({"email": email, "name": name, "password": password}));

      if (response.statusCode == 200) {
        result = json.decode(response.body);
        print(result);
      } else {
        result = json.decode(response.body);
        throw Message(result['message']);
      }
    } on SocketException {
      throw Message('No Internet Connection');
    } on HttpException {
      throw Message('Couldn\'t find the post ');
    } on FormatException {
      throw Message("Bad response format");
    }
  }

  Future<void> login(String email, String password) async {
    try {
      var result;
      final response = await http.post(AppUrl.login,
          body: json.encode({'login': email, 'password': password}));

      if (response.statusCode == 200) {
        result = json.decode(response.body);
        _emailId = result['email'];
        _userName = result['name'];
        _token = result['user-token'];
        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'token': _token,
          'userName': _userName,
          'emailId': _emailId,
        });
        prefs.setString('userData', userData);
        notifyListeners();
      } else {
        result = json.decode(response.body);
        throw Message(result['message']);
      }
    } on SocketException {
      throw Message('No Internet Connection');
    } on HttpException {
      throw Message('Couldn\'t find the post ');
    } on FormatException {
      throw Message("Bad response format");
    }
  }
}
