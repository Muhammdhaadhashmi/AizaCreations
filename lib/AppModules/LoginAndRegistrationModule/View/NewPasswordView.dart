import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/View/LoginAndSingupAppBar.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewModel/SigUpViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/InputFields/CustomTextFiled.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NewPassword extends StatefulWidget {
  String email;
  NewPassword({Key? key, required this.email}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  var controller = Get.put(SigUpViewModel());
  String newPassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            loginAppBar(
                body: Container(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_rounded),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      alignment: Alignment.topLeft,
                    )),
                width: AppConfig(context: context).width,
                height: AppConfig(context: context).height / 8),
            myText(
                title: 'New Password', fontweight: FontWeight.w600, size: 20),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CustomTextFiled(
                    isPass: false,
                    hintText: 'Enter New Password',
                    width: AppConfig(context: context).width / 1.2,
                    controller: controller.email.value,
                    function: (value) {
                      setState(() {
                        newPassword = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  callback: () {
                    showLoadingIndicator(context: context);
                    controller.onChangePassword(
                        context: context,
                        email: widget.email,
                        newPass: newPassword);
                  },
                  text: 'Change Password',
                  textColor: Colors.white,
                  btnColor: AppColor().primaryColor,
                  borderColor: Colors.transparent,
                  width: AppConfig(context: context).width / 2,
                  height: AppConfig(context: context).height / 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
