import 'dart:convert';

import 'package:aizacreationzz/AppModules/AppRootPage/AppRootPage.dart';
import 'package:aizacreationzz/AppModules/Utils/CheckConnectivity.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  var isLoading = false.obs;
  var userNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  onLogin({required BuildContext context}) async {
    if (await CheckConnectivityServices().onConnectivity(context)) {
      isLoading.value = true;
      var data = {
        "user_email": userNameController.value.text.toString(),
        "user_password": passwordController.value.text.toString()
      };
      print(data);
      var response = await ApiCall().createAccount(ApisUtills().loginUrl, data);
      isLoading.value = false;
      print(response.statusCode);
      // print(jsonDecode(response.body)["data"]);
      if (response.statusCode==200) {
        await DatabaseHandler()
            .setCurrentUser(jsonDecode(response.body)["data"]);
        ShowMessage().showMessage(context, "User Login Successfully");
        Get.offAll(() => AppRootPage());
      } else {
        ShowMessage().showErrorMessage(context, "Invalid Credentials");
      }
    }
  }
}
