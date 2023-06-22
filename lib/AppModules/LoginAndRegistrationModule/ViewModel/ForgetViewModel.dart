import 'dart:convert';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/View/NewPasswordView.dart';
import 'package:aizacreationzz/AppModules/Utils/CheckConnectivity.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetViewModel extends GetxController {
  var check = true.obs;
  var email = TextEditingController().obs;
  var otp = "".obs;
  var isLoading = false.obs;

  onsendOTP({required BuildContext context}) async {
    if (email.value.text.isNotEmpty) {
      if (await CheckConnectivityServices().onConnectivity(context)) {
        showLoadingIndicator(context: context);
        isLoading.value = true;
        var data = {
          "user_email": email.value.text.toString(),
        };
        print(data);
        var response =
            await ApiCall().postRequest(ApisUtills().sendOTPUrl, data);
        hideOpenDialog(context: context);
        isLoading.value = false;
        if (response.statusCode == 200) {
          check.value = false;
          // ShowMessage().showMessage(context, "User Registered Successfully");
          // Get.offAll(()=>OTP_verification(email:email.value.text.toString(),));
        } else if (response.statusCode >= 500) {
          check.value = false;
          ShowMessage().showErrorMessage(context, "Something went wrong ");
          // Get.offAll(()=>OTP_verification(email:email.value.text.toString(),));
        } else {
          ShowMessage()
              .showMessage(context, "${jsonDecode(response.body)["message"]}");
        }
        print(jsonDecode(response.body));
      }
    } else {
      ShowMessage().showErrorMessage(context, "Email is Required");
    }
  }

  onOTPVerify(
      {required BuildContext context,
      required String email,
      required String otp}) async {
    if (await CheckConnectivityServices().onConnectivity(context)) {
      isLoading.value = true;
      var data = {
        "random": otp.toString(),
        "user_email": email.toString(),
      };
      print(data);
      var response =
          await ApiCall().postRequest(ApisUtills().verifyOTPURL, data);
      hideOpenDialog(context: context);
      isLoading.value = false;
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // ShowMessage().showMessage(context, "User Registered Successfully");
        Get.offAll(() => NewPassword(email: email.toString()));
      } else {
        ShowMessage()
            .showMessage(context, "${jsonDecode(response.body)["message"]}");
      }
      print(jsonDecode(response.body));
    }
  }
}
