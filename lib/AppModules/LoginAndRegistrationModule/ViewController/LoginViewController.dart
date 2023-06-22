// ignore_for_file: must_be_immutable

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/View/LoginAndSingupAppBar.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/ForgetPasswordViewController.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewModel/LoginViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/InputFields/CustomTextFiled.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SignUpviewController.dart';

class LoginScreenViewController extends StatelessWidget {
  LoginScreenViewController({Key? key}) : super(key: key);

  var controller = Get.put(LoginViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: AppConfig(context: context).width,
            height: AppConfig(context: context).height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    loginAppBar(
                        body: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/loginlogo.png',
                            height: AppConfig(context: context).height / 6,
                          ),
                        ),
                        width: AppConfig(context: context).width,
                        height: AppConfig(context: context).height / 3),
                    myText(
                        title: 'Login', fontweight: FontWeight.w600, size: 20),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFiled(
                        isPass: false,
                        hintText: 'Email',
                        errorText: "Email is Required",
                        width: AppConfig(context: context).width / 1.2,
                        controller: controller.userNameController.value,
                        function: (value) {
                          // controller.userNameController.value = value;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFiled(
                        isPass: true,
                        hintText: 'Password',
                        errorText: "Password is Required",
                        width: AppConfig(context: context).width / 1.2,
                        controller: controller.passwordController.value,
                        function: (value) {
                          // controller.userNameController.value = value;
                        }),
                    SizedBox(height: 5),
                    Container(
                      width: AppConfig(context: context).width / 1.3,
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ForgetPasswordViewController());
                        },
                        child: Text(
                          'Forget password?',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => !controller.isLoading.value
                          ? CustomButton(
                              callback: () {
                                if (formKey.currentState!.validate())
                                  controller.onLogin(context: context);
                                //
                                // Get.offAll(() => AppRootPage());
                              },
                              text: 'Login',
                              textColor: Colors.white,
                              btnColor: Colors.black,
                              borderColor: Colors.transparent,
                              width: AppConfig(context: context).width - 80,
                              height: AppConfig(context: context).height / 14,
                            )
                          : Container(
                              width: AppConfig(context: context).width - 80,
                              height: AppConfig(context: context).height / 14,
                              child: SpinKitView(themeIsDark: false),
                            ),
                    ),
                    SizedBox(
                      height: AppConfig(context: context).height / 4.2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account ",
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 16)),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignUpViewController());
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: AppColor().primaryColor,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
