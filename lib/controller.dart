import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController with StateMixin {

  Map<String, dynamic> data = new Map<String, dynamic>();
  List<Map<dynamic, dynamic>> packageData = new List<Map<String, dynamic>>.empty(growable: true);

  @override
  void onInit() async {
    apiData();
    super.onInit();
  }

  apiData() async {
    var url = Uri.parse('http://cgprojects.in/flutter/');
    var response = await http.get(url);
    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      change("sucess",status: RxStatus.success());
    }
    else{
      change("error",status: RxStatus.error());

    }
  }
}
