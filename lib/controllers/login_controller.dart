import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoginController extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void loginApi() async {


    try{ final response = await http.post(Uri.parse('https://reqres.in/api/login'),
        body: {

          "email": "",
          "password": ""
        }
    );

        var data = jsonDecode(response.body);
        print(response.statusCode);
        print(data);
        if(response.statusCode==200){


        }else{}

    }
    catch(e){
      print('Exception: $e');
      Get.snackbar(
        'Exception',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

  }


}