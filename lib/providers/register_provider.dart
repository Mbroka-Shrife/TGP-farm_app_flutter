import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:farm_app/services/api.dart';

class RegisterProvider with ChangeNotifier {
  bool isLoading = false;

  // 1. تسجيل المزارع
  Future<List> registerFarmer(Map<String, dynamic> data) async {
    isLoading = true;
    notifyListeners();
    try {
      
      final response = await Api().post('/farmer/register', data);
      // var responseData = jsonDecode(response.body);
      // isLoading = false;
      // notifyListeners();
      // return RegisterModel.fromJson(responseData);
         print("Error in Register: $response");
      if(response.statusCode == 200 || response.statusCode ==201){
          isLoading = false;
    notifyListeners();
        return [true , json.decode(response.body)["message"]];
      }else{
          isLoading = false;
    notifyListeners();
        return [false , json.decode(response.body)["message"]];
      }
    } catch (e) {
      print("Error in Register: $e");
      isLoading = false;
      notifyListeners();
      return [false , "swr$e"];
    }
  }

  // 2. تسجيل الزبون
  Future<List> registerCustomer(Map<String, dynamic> data) async {
   

     isLoading = true;
    notifyListeners();
    try {
      final response = await Api().post('/customer/register', data);
      // var responseData = jsonDecode(response.body);
      // isLoading = false;
      // notifyListeners();
      // return RegisterModel.fromJson(responseData);

      if(response.statusCode == 200 || response.statusCode ==201){
          isLoading = false;
    notifyListeners();
        return [true , json.decode(response.body)["message"]];
      }else{
          isLoading = false;
    notifyListeners();
        return [false , json.decode(response.body)["message"]];
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return [false , "swr"];
    }
  }
}