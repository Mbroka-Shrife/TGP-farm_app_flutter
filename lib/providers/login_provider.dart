import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:farm_app/services/api.dart';
import 'package:farm_app/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool isLoading = false;

  Future<LoginModel> loginUser(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await Api().post('/login', {
        'email': email,
        'password': password,
      });

      var data = jsonDecode(response.body);
      LoginModel loginResponse = LoginModel.fromJson(data);

      if (loginResponse.status == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", loginResponse.token!);
        await prefs.setString("role", loginResponse.user!.role);
      }

      isLoading = false;
      notifyListeners();
      return loginResponse;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return LoginModel(status: false, message: "Connection Error: $e");
    }
  }
}