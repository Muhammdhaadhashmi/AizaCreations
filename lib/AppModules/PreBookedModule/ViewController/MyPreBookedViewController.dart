import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/ProductModel.dart';
import 'package:aizacreationzz/AppModules/HomeModule/View/FeaturedView.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';

class MyPreBookedViewController extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        // drawer: buildDrawer(context: context),
        backgroundColor: Colors.white,
        body: Container(
          height: AppConfig(context: context).height,
          width: AppConfig(context: context).width,
          child: Column(
            children: [
              customAppBar(
                  onSearch: (value) {},
                  scaffoldKey: scaffoldKey,
                  context: context,
                  text: "Aiza Creationzz"),
              Container(
                  height: 50,
                  width: AppConfig(context: context).width,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? AppColor().primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 4)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myText(
                                txtalign: TextAlign.start,
                                title: index == 0
                                    ? "     All       "
                                    : "  Men's Fassion  ",
                                color: index == 0
                                    ? Colors.white
                                    : AppColor().primaryColor,
                                fontweight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: AppConfig(context: context).width,
                    child: ListView(
                      children: [
                        Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: [1, 2, 3, 4, 5, 6, 7, 8].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return productTile(
                                    context,
                                    ProductModel(
                                        pro_color: "pro_color",
                                        pro_discount: "20",
                                        pro_discription: "this is description",
                                        pro_Id: "0",
                                        pro_image:
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
                                        isliked: false,
                                        pro_name: "Astylish Shoe",
                                        pro_price: "100",
                                        pro_quantity: "10",
                                        pro_size: "10",
                                        pro_status: "Status",
                                        cat_id: "1",
                                        pro_video: ""),
                                    () {},
                                    false,
                                    true,
                                    false);
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
