import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/InputFields/CustomTextFiled.dart';
import 'package:flutter/material.dart';

class CreateAddress extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Container(
          height: AppConfig(context: context).height,
          width: AppConfig(context: context).width,
          child: Column(
            children: [
              customAppBar(
                  onSearch: (value) {},
                  scaffoldKey: scaffoldKey,
                  context: context,
                  text: "Shiping Address",
                  isDrawer: false,
                  isSearch: false,
                  isCart: false),
              Expanded(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      isPass: false,
                      hintText: 'Shipping Address',
                      width: AppConfig(context: context).width / 1.2,
                      controller: TextEditingController(),
                      function: (value) {}),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      isPass: false,
                      hintText: 'City',
                      width: AppConfig(context: context).width / 1.2,
                      controller: TextEditingController(),
                      function: (value) {}),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      isPass: false,
                      hintText: 'Postal Code',
                      width: AppConfig(context: context).width / 1.2,
                      controller: TextEditingController(),
                      function: (value) {}),
                  Spacer(),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      text: "Continue",
                      callback: () {
                        // Get.to(() => ShippingAddress());
                      },
                      height: 45,
                      textColor: Colors.white,
                      width: AppConfig(context: context).width - 50,
                      btnColor: AppColor().primaryColor,
                      borderColor: Colors.transparent),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
