import 'dart:convert';

import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/LoginViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/CheckConnectivity.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordViewModel extends GetxController{
var passwordController=TextEditingController().obs;
var newPasswordController=TextEditingController().obs;
var isLoading=false.obs;
onChangePassword({required BuildContext context})async{
  if(await CheckConnectivityServices().onConnectivity(context)){
    // if(passwordController.value.text==newPasswordController.value.text){
    var localUser = await DatabaseHandler().getCurrentUser();
    // await DatabaseHandler().setCart(("0"));
    print(localUser["user_id"]);
      var data={
        "user_id":"${localUser["user_id"]}",
        "old_pass":passwordController.value.value.text,
        "new_pass":newPasswordController.value.value.text,

      };
    isLoading.value=true;
      var response = await ApiCall()
          .postRequest(ApisUtills().changePassword ,data);
    isLoading.value=false;
    print(jsonDecode(response.body));
    if(response!=null && response.statusCode==200){
      Get.offAll(()=>LoginScreenViewController());
    }
    else{
      ShowMessage().showErrorMessage(context, "Something wrong");
    }
  }
}
}