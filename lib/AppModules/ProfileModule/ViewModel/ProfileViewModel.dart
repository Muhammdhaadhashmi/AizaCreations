import 'package:aizacreationzz/AppModules/ProfileModule/Model/User.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfileViewModel extends GetxController {
  var isLoading = false.obs;
  var userAddress = "".obs;
  var userAlternativeAddress = "".obs;
  var userAlternativeContact = "".obs;
  var userContact = "".obs;
  var userEmail = "".obs;
  var userId = "".obs;
  var userImage = "".obs;
  var userName = "".obs;
  var userPassword = "".obs;
  var userShippingAddress = "".obs;
  var userShippingNumber = "".obs;
  var userData = User(
    userId: "Enter User Name",
    userName: "Enter User Name",
    userAddress: "Enter Address",
    userAlternativeAddress: "Enter AlterNate address",
    userAlternativeContact: "Enter AlterNate Number",
    userContact: "Enter User Number",
    userEmail: "Enter E-mail",
    userImage: "",
    userPassword: "Enter Password",
    userShippingAddress: "Enter Shipping Address",
    userShippingNumber: "Enter Shipping Number",
  ).obs;

  onFetchUser() async {
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    var data = await ApiCall()
        .getRequest(ApisUtills().userByIdUrl + "${localUser["user_id"]}");

    if (data != "") {
      print("user have data");
      print(data["data"][0]);
      userId.value = data["data"][0]["user_id"];
      userName.value = data["data"][0]["user_name"];
      userContact.value = data["data"][0]["user_contact"];
      userEmail.value = data["data"][0]["user_email"];
      userAddress.value = data["data"][0]["user_address"];
      userAlternativeAddress.value =
          data["data"][0]["user_alternative_address"];
      userShippingAddress.value = data["data"][0]["user_shipping_address"];
      userShippingNumber.value = data["data"][0]["user_shipping_number"];
      userAlternativeContact.value =
          data["data"][0]["user_alternative_contact"];
//       userData.value= User.user_from_JSON(data["data"][0]);
// print(  User.user_from_JSON(data["data"][0]));
    } else {
      print("user dont data");
      // userData.value = User(
      //     userId: "Enter User Name",
      //     userName: "Enter User Name",
      //     userAddress: "Enter Address",
      //     userAlternativeAddress: "Enter AlterNate address",
      //     userAlternativeContact: "Enter AlterNate Number",
      //     userContact: "Enter User Number",
      //     userEmail: "Enter E-mail",
      //     userImage: "",
      //     userPassword: "Enter Password",
      //     userShippingAddress: "Enter Shipping Address",
      //     userShippingNumber: "Enter Shipping Number");
    }
  }

  onSaveProfile() async {
    isLoading.value = true;
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    // ignore: unused_local_variable
    var body = {
      "user_id": "${localUser["user_id"].toString()}",
      "user_name": userName.value.toString(),
      "user_contact": userContact.value,
      "user_email": userEmail.value,
      "user_address": userAddress.value,
      "user_alternative_address": userAlternativeAddress.value,
      "user_shipping_address": userShippingAddress.value,
      "user_shipping_number": userShippingNumber.value,
      "user_alternative_contact": userAlternativeContact.value,
    };
    // String input = '{"accessCode":"ID","pager":{"start":0,"count":2147483647}}';
    http.Response response = await http.put(
      Uri.parse("${ApisUtills().baseUrl + ApisUtills().update_user_url}"),
      body:
          "user_name=${userName.value}&user_id=${localUser["user_id"].toString()}&user_contact=${userContact.value}&user_email=${userEmail.value}&user_address=${userAddress.value}&user_alternative_address=$userAlternativeAddress&user_shipping_address=$userShippingAddress&user_shipping_number=$userShippingNumber&user_alternative_contact=$userAlternativeContact",
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      encoding: Encoding.getByName("utf-8"),
    );
    print(jsonDecode(response.body));
    onFetchUser();
    isLoading.value = false;
  }
}
