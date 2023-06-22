import 'package:aizacreationzz/AppModules/CategoryModule/ViewModel/CategoryViewModel.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/CateGoryModel.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/ViewController/ProductsViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

Widget categoryTile(BuildContext context, CategoryViewModel controller,
    String id, CategoryModel data) {
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
    child: InkWell(
      onTap: () {
        Get.to(() => ProductsViewController(
              categoryID: int.parse(data.categoryId),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
        // height: 100,
        // width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: GFImageOverlay(
                height: MediaQuery.of(context).size.height / 4.4,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: NetworkImage(
                  data.categoryImage.isNotEmpty
                      ? ApisUtills().imageUrl + "${data.categoryImage}"
                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",

                  // "${widget.controller!.categoriesList[index].categoryImage}",
                ),
                boxFit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              child: myText(
                  title: "${data.categoryName}",
                  color: AppColor().primaryColor,
                  fontweight: FontWeight.w700,
                  size: 15,
                  maxLines: 2,
                  txtOverFlow: TextOverflow.ellipsis),
            ),
            SizedBox(),
          ],
        ),
      ),
    ),
  );
}
