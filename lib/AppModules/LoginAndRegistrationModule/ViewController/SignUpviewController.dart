// ignore_for_file: must_be_immutable

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/View/LoginAndSingupAppBar.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/View/ShowContried.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/LoginViewController.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewModel/SigUpViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/InputFields/CustomTextFiled.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpViewController extends StatelessWidget {
  SignUpViewController({Key? key}) : super(key: key);
  var controller = Get.put(SigUpViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Obx(
          // () => controller.isLoading.value
          //     ? SpinKitView(themeIsDark: true)
          //     :
          Container(
        width: AppConfig(context: context).width,
        height: AppConfig(context: context).height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
            myText(title: 'SignUp', fontweight: FontWeight.w600, size: 20),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Obx(
                () => Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // imagePreView(
                      //       context: context,
                      //       image: controller.image.value,
                      //       controller: controller),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFiled(
                          isPass: false,
                          hintText: 'Full Name',
                          errorText: "Full Name is Required",
                          width: AppConfig(context: context).width / 1.2,
                          controller: controller.fullName.value,
                          function: (value) {
                            // controller.fullName.value = value;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                showCountries(
                                    context: context,
                                    onSelectCountry: (country) {
                                      controller.countryCode.value =
                                          country.phoneCode;
                                    });
                              },
                              child: Obx(
                                () => Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.grey[300]!)
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Colors.grey[500], blurRadius: 2)
                                      // ]

                                      ),
                                  child: Center(
                                      child: myText(
                                          title:
                                              "+${controller.countryCode.value}",
                                          color: Colors.grey[500]!)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: CustomTextFiled(
                                  keyboard: TextInputType.number,
                                  isPass: false,
                                  hintText: '3099899213',
                                  width: AppConfig(context: context).width / 2,
                                  errorText: "Phone Number is Required",
                                  controller: controller.phoneNumber.value,
                                  function: (value) {
                                    // controller.fullName.value=value;
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (controller.countryCode.value != "92")
                        CustomTextFiled(
                            isPass: false,
                            keyboard: TextInputType.number,
                            hintText: 'Pakistan Phone Number',
                            errorText: "Pakistan Phone Number is Required",
                            width: AppConfig(context: context).width / 1.2,
                            controller: controller.alterPhoneNumber.value,
                            function: (value) {
                              // controller.email.value = value;
                            }),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFiled(
                          isPass: false,
                          hintText: 'Email',
                          errorText: "Email is Required",
                          width: AppConfig(context: context).width / 1.2,
                          controller: controller.email.value,
                          function: (value) {
                            // controller.email.value = value;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFiled(
                          isPass: false,
                          hintText: 'Address',
                          errorText: "Address is Required",
                          width: AppConfig(context: context).width / 1.2,
                          controller: controller.address.value,
                          function: (value) {
                            // controller.address.value = value;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      if (controller.countryCode.value != "92")
                        CustomTextFiled(
                            isPass: false,
                            hintText: 'AlterNative Address',
                            errorText: "Alter Native Address is Required",
                            width: AppConfig(context: context).width / 1.2,
                            controller: controller.alterNativeAddress.value,
                            function: (value) {
                              // controller.alterNativeAddress.value = value;
                            }),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFiled(
                          isPass: false,
                          hintText: 'Shipping Address',
                          errorText: "Shipping Address is Required",
                          width: AppConfig(context: context).width / 1.2,
                          controller: controller.shippingAddress.value,
                          function: (value) {
                            // controller.shippingAddress.value = value;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFiled(
                          isPass: false,
                          hintText: 'Shipping Phone No',
                          keyboard: TextInputType.number,
                          errorText: "Shipping Phone Number is Required",
                          width: AppConfig(context: context).width / 1.2,
                          controller: controller.shippingPhoneNo.value,
                          function: (value) {
                            // controller.shippingPhoneNo.value = value;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFiled(
                          isPass: true,
                          hintText: 'Password',
                          errorText: "Password is Required",
                          width: AppConfig(context: context).width / 1.2,
                          controller: controller.password.value,
                          function: (value) {
                            // controller.password.value = value;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFiled(
                          isPass: true,
                          hintText: 'Confirm Password',
                          errorText: "Confirm Password is Required",
                          width: AppConfig(context: context).width / 1.2,
                          controller: controller.confirmPassword.value,
                          function: (value) {
                            // controller.confirmPassword.value = value;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => !controller.isLoading.value
                            ? CustomButton(
                                callback: () {
                                  if (formKey.currentState!.validate())
                                    controller.onSignUp(context: context);
                                },
                                text: 'SigUp',
                                textColor: Colors.white,
                                btnColor: AppColor().primaryColor,
                                borderColor: Colors.transparent,
                                width: AppConfig(context: context).width / 2,
                                height: AppConfig(context: context).height / 14,
                              )
                            : Container(
                                width: AppConfig(context: context).width - 80,
                                height: AppConfig(context: context).height / 14,
                                child: SpinKitView(themeIsDark: false),
                              ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have Account ",
                    style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreenViewController());
                  },
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                        color: AppColor().primaryColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
