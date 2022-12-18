import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user_model_list.dart';

class DataController extends GetxController {
  var url = Uri.parse('https://dummyapi.io/data/v1/user');
  UserModelList? userList;
  var isLoading = false.obs;

  getUserInformationFromApi() async {
    try {
      isLoading(true);
      http.Response response =
          await http.get(url, headers: {'app-id': '639eba2dfa19b456d70c13b9'});
      if (response.statusCode == 200) {
        //Valid response
        var result = jsonDecode(response.body);
        userList = UserModelList.fromJson(result);
      } else {
        //Err
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
