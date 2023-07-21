import 'dart:convert';

import 'package:ceckk/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static String userData = "userData";

  static Future<UserModel> getUserDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = preferences.getString(userData) ?? "";
    if (data.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(data));
    }
    return UserModel();
  }

  static Future<void> setUserData({required UserModel data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String finalData = jsonEncode(data.toJson());
    preferences.setString(userData, finalData);
  }
}
