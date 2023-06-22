import 'package:aizacreationzz/AppModules/HomeModule/View/FeaturedView.dart';
import 'package:aizacreationzz/AppModules/PreBookedModule/pre_book_view_model.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

// ignore: camel_case_types
class pre_booking_list extends StatefulWidget {
  pre_booking_list({Key? key}) : super(key: key);

  @override
  _pre_booking_listState createState() => _pre_booking_listState();
}

// ignore: camel_case_types
class _pre_booking_listState extends State<pre_booking_list> {
  final controller = Get.put(pre_book_view_model());
  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();
    controller.currentIndex.value = 1;
    fetchAndSetFuture = controller.onGetProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchAndSetFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SpinKitView(themeIsDark: false),
              ),
            );
          if (controller.productsList.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("No Products"),
              ),
            );
          }
          return Container(
            // width: AppConfig(context: context).width,
            child: Obx(
              () => IntrinsicGridView.vertical(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                  // columnCount: 3,
                  verticalSpace: 10,
                  horizontalSpace: 10,
                  children: [
                    for (int i = 0; i < controller.productsList.length; i++)
                      Obx(
                        () {
                          return productTile(
                              context, controller.productsList[i], () async {
                            showLoadingIndicator(context: context);
                            controller.AddToFav(
                                    context: context,
                                    pro_id: controller.productsList[i].pro_Id)
                                .then((value) => {
                                      if (value)
                                        {
                                          print("on fav"),
                                          setState(() {
                                            controller.productsList[i].isliked =
                                                !controller
                                                    .productsList[i].isliked;
                                          }),
                                        }
                                    });

                            print(controller.productsList[i].isliked);
                          }, false, true, false);
                        },
                      ),
                  ]),
            ),
          );
        });
  }
}
