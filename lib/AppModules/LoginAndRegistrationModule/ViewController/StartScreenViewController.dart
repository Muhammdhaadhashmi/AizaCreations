import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/LoginViewController.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/SignUpviewController.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreenViewController extends StatelessWidget {
  StartScreenViewController({Key? key}) : super(key: key);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logo/splashLogo.png',
              ),
              height: 150,
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              width: AppConfig(context: context).width,
              decoration: BoxDecoration(
                color: AppColor().primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(34),
                  topLeft: Radius.circular(34),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    myText(
                        title: 'Welcome',
                        fontweight: FontWeight.w600,
                        size: 20),
                    SizedBox(
                      height: 10,
                    ),
                    myText(
                        title: 'Aiza Creation We provide Best product .'
                            'Our Product enhance your Inner Beauty.'
                            'We provide Best Ever Services.Our product available all over the world',
                        txtalign: TextAlign.start,
                        size: 14),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          callback: () {
                            Get.to(LoginScreenViewController());
                          },
                          text: 'Sign In',
                          textColor: Colors.white,
                          btnColor: Colors.black,
                          borderColor: Colors.transparent,
                          width: AppConfig(context: context).width / 3.5,
                          height: AppConfig(context: context).height / 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomButton(
                          callback: () {
                            Get.to(() => SignUpViewController());
                          },
                          text: 'Sign Up',
                          textColor: Colors.black,
                          btnColor: Colors.white,
                          borderColor: Colors.transparent,
                          width: AppConfig(context: context).width / 3.5,
                          height: AppConfig(context: context).height / 14,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
