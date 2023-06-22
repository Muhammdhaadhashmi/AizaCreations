import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHandler {
  Future<bool> isExists(String inputString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var check = prefs.getString(inputString);
    return check == null ? false : true;
  }

  deleteUser(String inputString) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString('currentUser') ?? '';
    // print(jsonDecode(response));
    // print(
    //   User().fromMap(jsonDecode(response)).toString() + "+++++++++++");
    return jsonDecode(response);
  }

  setCurrentUser(Map<String, dynamic> myData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var data = User().toLocalMap(myData);
    String rawJson = jsonEncode(myData);
    print(rawJson);
    final result = await prefs.setString('currentUser', rawJson);
    print("List is saved " + result.toString());
  }

  setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString('token', token);
    print("token saved" + result.toString());
  }

  setCart(int cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await prefs.setInt('cart', cart);
    print("token saved" + result.toString());
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString('token') ?? '';
    // print(jsonDecode(response));
    // print(
    //   User().fromMap(jsonDecode(response)).toString() + "+++++++++++");
    return response;
  }

  getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getInt('cart') ?? 0;
    // print(jsonDecode(response));
    // print(
    //   User().fromMap(jsonDecode(response)).toString() + "+++++++++++");
    return response;
  }
}
