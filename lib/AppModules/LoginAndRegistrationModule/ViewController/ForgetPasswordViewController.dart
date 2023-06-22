// ignore_for_file: must_be_immutable

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/View/LoginAndSingupAppBar.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewModel/ForgetViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/InputFields/CustomTextFiled.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPasswordViewController extends StatelessWidget {
  ForgetPasswordViewController({Key? key}) : super(key: key);

  var controller = Get.put(ForgetViewModel());

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
                title: 'Forget Password',
                fontweight: FontWeight.w600,
                size: 20),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => controller.check.value
                  ? Column(
                      children: [
                        CustomTextFiled(
                            isPass: false,
                            hintText: 'Enter a Email',
                            width: AppConfig(context: context).width / 1.2,
                            controller: controller.email.value,
                            function: (value) {
                              // controller.email.value = value;
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          callback: () {
                            print("Send otp");

                            controller.onsendOTP(context: context);
                          },
                          text: 'Send Verification',
                          textColor: Colors.white,
                          btnColor: AppColor().primaryColor,
                          borderColor: Colors.transparent,
                          width: AppConfig(context: context).width / 2,
                          height: AppConfig(context: context).height / 14,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                            width: AppConfig(context: context).width / 1.2,
                            child: PinCodeTextField(
                              appContext: context,

                              length: 4,
                              obscureText: false,
                              animationType: AnimationType.scale,
                              keyboardType: TextInputType.number,
                              animationDuration: Duration(milliseconds: 300),
                              // errorAnimationController: errorController, // Pass it here
                              onChanged: (value) {
                                controller.otp.value = value;
                              },
                              enablePinAutofill: true,
                              keyboardAppearance: Brightness.light,
                              // pinTheme: PinTheme(
                              //   shape: PinCodeFieldShape.underline,
                              //   // borderRadius: BorderRadius.circular(5),
                              //   fieldHeight: 40,
                              //   fieldWidth: 40,
                              //   activeFillColor:
                              //   true ? Colors.blue.shade100 : Colors.black,
                              // ),
                            )
                            // PinCodeTextField(
                            //   length: 4,
                            //   obscureText: false,
                            //   animationType: AnimationType.fade,
                            //   // pinTheme: PinTheme(
                            //   //   shape: PinCodeFieldShape.box,
                            //   //   fieldHeight: 50,
                            //   //   fieldWidth: 40,
                            //   //   activeFillColor: Colors.white,
                            //   // ),
                            //   animationDuration: Duration(milliseconds: 300),
                            //   backgroundColor: Colors.transparent,
                            //   enableActiveFill: true,
                            //
                            //   onCompleted: (v) {
                            //     print("Completed");
                            //   },
                            //   onChanged: (value) {
                            //     controller.otp.value=value;
                            //   },
                            //   appContext: context,
                            // ),
                            ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          callback: () {
                            showLoadingIndicator(context: context);
                            controller.onOTPVerify(
                                context: context,
                                email: controller.email.value.value.text,
                                otp: controller.otp.value);
                          },
                          text: 'Verify',
                          textColor: Colors.white,
                          btnColor: AppColor().primaryColor,
                          borderColor: Colors.transparent,
                          width: AppConfig(context: context).width / 2,
                          height: AppConfig(context: context).height / 14,
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
