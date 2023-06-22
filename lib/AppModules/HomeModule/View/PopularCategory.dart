import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/HomeViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';

import '../../ProductsModule/ViewController/ProductsViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PopularCategory extends StatefulWidget {
  HomeViewModel? controller;

  PopularCategory({
    required this.controller,
  });

  @override
  _PopularCategoryState createState() => _PopularCategoryState();
}

class _PopularCategoryState extends State<PopularCategory> {
  @override
  void initState() {
    super.initState();
    widget.controller!.onGetCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 110,
          // color: Colors.tealAccent,
          child: ListView.builder(
            itemCount: widget.controller!.categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => ProductsViewController(
                        categoryID: int.parse(widget
                            .controller!.categoriesList[index].categoryId),
                      ),
                    );
                  },
                  child: Container(
                    // height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor().primaryColor.withOpacity(0.4),
                    ),
                    width: 90,

                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.darken),
                                child: Image(
                                  image: NetworkImage(
                                    widget.controller!.categoriesList[index]
                                            .categoryImage.isNotEmpty
                                        ? ApisUtills().imageUrl +
                                            "${widget.controller!.categoriesList[index].categoryImage}"
                                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",

                                    // "${widget.controller!.categoriesList[index].categoryImage}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                        myText(
                            title:
                                "${widget.controller!.categoriesList[index].categoryName}",
                            color: Colors.white,
                            maxLines: 2,
                            txtOverFlow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
