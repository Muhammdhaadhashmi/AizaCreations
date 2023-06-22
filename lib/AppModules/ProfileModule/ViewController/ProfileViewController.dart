import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/ProfileModule/View/ProfileTextFiled.dart';
import 'package:aizacreationzz/AppModules/ProfileModule/ViewModel/ProfileViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool fromDrawer;

  ProfileViewController({required this.scaffoldKey, required this.fromDrawer});

  @override
  _ProfileViewControllerState createState() => _ProfileViewControllerState();
}

class _ProfileViewControllerState extends State<ProfileViewController> {
  var controller = Get.put(ProfileViewModel());

  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();

    fetchAndSetFuture = controller.onFetchUser();
  }

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
                  isDrawer: widget.fromDrawer ? false : true,
                  isSearch: false,
                  isCart: true),
              // loginAppBar(
              //     body: Container(
              //         alignment: Alignment.center,
              //         child: Container(
              //           padding: EdgeInsets.only(top: 15),
              //           child: IconButton(
              //             icon: Icon(Icons.arrow_back_rounded),
              //             onPressed: () {
              //               Get.back();
              //             },
              //           ),
              //           alignment: Alignment.topLeft,
              //         )),
              //     width: AppConfig(context: context).width,
              //     height: AppConfig(context: context).height / 8),
              // myText(title: 'Profile', fontweight: FontWeight.w600, size: 20),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(() => controller.isLoading.value
                    ? SpinKitView(themeIsDark: false)
                    : SingleChildScrollView(
                        child: FutureBuilder(
                            future: fetchAndSetFuture,
                            // future:  controller.onGetProducts(categoryID: widget.categoryID),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return Container(
                                  child: Center(
                                    child: SpinKitView(themeIsDark: false),
                                  ),
                                );
                              return Form(
                                child: Column(children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // imagePreView(
                                  //     context: context,
                                  //     image: controller.image.value,
                                  //     controller: controller),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Obx(
                                    () => profileInputFiled(
                                      context: context,
                                      width: AppConfig(context: context).width /
                                          1.1,
                                      labelText: 'Full Name',
                                      onChange: (value) {
                                        controller.userName.value = value;
                                      },
                                      hintText: "${controller.userName.value}",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => profileInputFiled(
                                        onChange: (value) {
                                          controller.userContact.value = value;
                                        },
                                        context: context,
                                        width:
                                            AppConfig(context: context).width /
                                                1.1,
                                        labelText: 'Phone Number',
                                        hintText:
                                            "${controller.userContact.value}"),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => profileInputFiled(
                                        onChange: (value) {
                                          controller.userEmail.value = value;
                                        },
                                        context: context,
                                        width:
                                            AppConfig(context: context).width /
                                                1.1,
                                        labelText: 'Email',
                                        hintText:
                                            "${controller.userEmail.value}"),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => profileInputFiled(
                                        onChange: (value) {
                                          controller.userAddress.value = value;
                                        },
                                        context: context,
                                        width:
                                            AppConfig(context: context).width /
                                                1.1,
                                        labelText: 'Address',
                                        hintText:
                                            "${controller.userAddress.value}"),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => profileInputFiled(
                                        onChange: (value) {
                                          controller.userAlternativeContact
                                              .value = value;
                                        },
                                        context: context,
                                        width:
                                            AppConfig(context: context).width /
                                                1.1,
                                        labelText: 'Alternative Contact',
                                        hintText:
                                            "${controller.userAlternativeContact.value}"),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => profileInputFiled(
                                        onChange: (value) {
                                          controller.userAlternativeAddress
                                              .value = value;
                                        },
                                        context: context,
                                        width:
                                            AppConfig(context: context).width /
                                                1.1,
                                        labelText: 'Alter Native Address',
                                        hintText:
                                            "${controller.userAlternativeAddress.value}"),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => profileInputFiled(
                                        onChange: (value) {
                                          controller.userShippingAddress.value =
                                              value;
                                        },
                                        context: context,
                                        width:
                                            AppConfig(context: context).width /
                                                1.1,
                                        labelText: 'Shipping Address',
                                        hintText:
                                            "${controller.userShippingAddress.value}"),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => profileInputFiled(
                                        onChange: (value) {
                                          controller.userShippingNumber.value =
                                              value;
                                        },
                                        context: context,
                                        width:
                                            AppConfig(context: context).width /
                                                1.1,
                                        labelText: 'Shipping Phone No',
                                        hintText:
                                            "${controller.userShippingNumber.value}"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                    callback: () {
                                      controller.onSaveProfile();
                                    },
                                    text: 'Save Profile',
                                    textColor: Colors.white,
                                    btnColor: AppColor().primaryColor,
                                    borderColor: Colors.transparent,
                                    width:
                                        AppConfig(context: context).width / 2,
                                    height:
                                        AppConfig(context: context).height / 14,
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                ]),
                              );
                            }))),
              )
            ])));
  }
}
