import 'dart:convert';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/LoginViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/CheckConnectivity.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigUpViewModel extends GetxController {
  var pincode = "".obs;
  var isLoading = false.obs;
  var image = "".obs;
  var countryCode = "92".obs;
  var fullName = TextEditingController().obs;
  var phoneNumber = TextEditingController().obs;
  var alterPhoneNumber = TextEditingController().obs;
  var city = TextEditingController().obs;
  var address = TextEditingController().obs;
  var alterNativeAddress = TextEditingController().obs;
  var shippingAddress = TextEditingController().obs;
  var shippingPhoneNo = TextEditingController().obs;
  var email = TextEditingController().obs;
  var password = TextEditingController().obs;
  var confirmPassword = TextEditingController().obs;

  onSignUp({required BuildContext context}) async {
    if (await CheckConnectivityServices().onConnectivity(context)) {
      if (password.value.text == confirmPassword.value.text) {
        isLoading.value = true;
        var data = {
          "user_name": fullName.value.text.toString(),
          "user_email": email.value.text.toString(),
          "user_contact": phoneNumber.value.text.toString(),
          "user_alternative_contact": alterPhoneNumber.value.text.isNotEmpty
              ? alterPhoneNumber.value.text
              : phoneNumber.value.text.toString(),
          "user_address": address.value.text,
          "user_alternative_address": alterNativeAddress.value.text.isNotEmpty
              ? address.value.text
              : address.value.text.toString(),
          "user_shipping_address": shippingAddress.value.text,
          "user_shipping_number": int.parse(shippingPhoneNo.value.text),
          "user_password": password.value.text,
        };
        print(data);

        var response =
            await ApiCall().createAccount(ApisUtills().registerUrl, data);
        isLoading.value = false;
        // print(jsonDecode(response.body));
        if (response.statusCode == 200) {
          // ShowMessage().showMessage(context, "User Registered Successfully");
          Get.offAll(() => LoginScreenViewController());
          // Get.to(()=>OTP_verification(email:email.value.text.toString(),));
        } else {
          ShowMessage()
              .showMessage(context, "${jsonDecode(response.body)["message"]}");
        }

        print(jsonDecode(response.body));
      } else {
        ShowMessage().showErrorMessage(context, "Invalid Confirm Password");
      }
    }
  }

  onOTPVerify(
      {required BuildContext context,
      required String email,
      required String otp}) async {
    if (password.value.text == confirmPassword.value.text) {
      isLoading.value = true;
      var data = {
        "random": otp,
        "user_email": email,
      };
      print(data);
      var response =
          await ApiCall().createAccount(ApisUtills().verifyOTPURL, data);
      isLoading.value = false;
      if (response.statusCode == 200) {
        // ShowMessage().showMessage(context, "User Registered Successfully");
        Get.offAll(() => LoginScreenViewController());
      } else {
        ShowMessage()
            .showMessage(context, "${jsonDecode(response.body)["message"]}");
      }

      print(jsonDecode(response.body));
    }
  }

  onChangePassword(
      {required BuildContext context,
      required String email,
      required String newPass}) async {
    if (password.value.text == confirmPassword.value.text) {
      isLoading.value = true;
      var data = {
        "new_pass": newPass,
        "user_email": email,
      };
      print(data);
      var response =
          await ApiCall().postRequest(ApisUtills().changePassURL, data);
      hideOpenDialog(context: context);
      isLoading.value = false;
      if (response.statusCode == 200) {
        // ShowMessage().showMessage(context, "User Registered Successfully");
        Get.offAll(() => LoginScreenViewController());
      } else {
        ShowMessage()
            .showMessage(context, "${jsonDecode(response.body)["message"]}");
      }

      print(jsonDecode(response.body));
    }
  }
}
