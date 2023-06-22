import 'package:aizacreationzz/AppModules/ChangePasswordModule/ViewModel/ChnagePasswordViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/InputFields/CustomTextFiled.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordViewController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _ChangePasswordViewControllerState createState() =>
      _ChangePasswordViewControllerState();
}

class _ChangePasswordViewControllerState
    extends State<ChangePasswordViewController> {
  var controller = Get.put(ChangePasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: AppConfig(context: context).width,
            height: AppConfig(context: context).height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(children: [
              customAppBar(
                  onSearch: (value) {},
                  scaffoldKey: widget.scaffoldKey,
                  context: context,
                  text: "My Profile",
                  isDrawer: false,
                  isSearch: false,
                  isCart: true),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(() => controller.isLoading.value
                    ? SpinKitView(themeIsDark: false)
                    : SingleChildScrollView(
                        child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFiled(
                              isPass: true,
                              hintText: 'Old Password',
                              errorText: "Password is Required",
                              width: AppConfig(context: context).width / 1.2,
                              controller: controller.passwordController.value,
                              function: (value) {
                                // controller.userNameController.value = value;
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFiled(
                              isPass: true,
                              hintText: 'new Password',
                              errorText: "Password is Required",
                              width: AppConfig(context: context).width / 1.2,
                              controller:
                                  controller.newPasswordController.value,
                              function: (value) {
                                // controller.userNameController.value = value;
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            callback: () {
                              controller.onChangePassword(context: context);
                            },
                            text: 'Change Password',
                            textColor: Colors.white,
                            btnColor: Colors.black,
                            borderColor: Colors.transparent,
                            width: AppConfig(context: context).width - 80,
                            height: AppConfig(context: context).height / 14,
                          )
                        ],
                      ))),
              )
            ])));
  }
}
