// ignore_for_file: must_be_immutable, camel_case_types

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/View/LoginAndSingupAppBar.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewModel/SigUpViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTP_verification extends StatefulWidget {
  String email;
  OTP_verification({Key? key, required this.email}) : super(key: key);

  @override
  _OTP_verificationState createState() => _OTP_verificationState();
}

class _OTP_verificationState extends State<OTP_verification> {
  var controller = Get.put(SigUpViewModel());
  String otp = "";
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
            myText(title: 'Verify OTP', fontweight: FontWeight.w600, size: 20),
            SizedBox(
              height: 20,
            ),
            myText(
                title: 'Check your email spam folder to otp if not received',
                fontweight: FontWeight.w500,
                size: 15),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: PinCodeTextField(
                    appContext: context,

                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    keyboardType: TextInputType.number,
                    animationDuration: Duration(milliseconds: 300),
                    // errorAnimationController: errorController, // Pass it here
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                      });
                    },
                    //   onSaved: (newValue) {
                    // setState(() {
                    //   otp=newValue!;
                    // });
                    //   },
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
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  callback: () {
                    controller.onOTPVerify(
                        context: context, email: widget.email, otp: otp);
                  },
                  text: 'SigUp',
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
