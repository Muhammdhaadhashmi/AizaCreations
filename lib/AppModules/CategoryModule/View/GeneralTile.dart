import 'package:aizacreationzz/AppModules/CategoryModule/ViewModel/GeneralViewModel.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

Widget generalTile(BuildContext context, GeneralViewModel controller, data) {
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
    child: InkWell(
      onTap: () {
        // Get.to(() => ProductsViewController(
        //       categoryID: int.parse(data.categoryId),
        //     ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
        height: 150,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // height: 120,
              // width: 150,
              child: GFImageOverlay(
                height: 160,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: NetworkImage(
                  data["pro_image"] == null
                      ? ApisUtills().imageUrl + "${data["pre_image"]}"
                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",

                  // "${widget.controller!.categoriesList[index].categoryImage}",
                ),
                boxFit: BoxFit.cover,
              ),
            ),
            myText(
                title: "${data["pre_id"]}",
                color: AppColor().primaryColor,
                fontweight: FontWeight.w700,
                size: 15),
            SizedBox(),
          ],
        ),
      ),
    ),
  );
}
