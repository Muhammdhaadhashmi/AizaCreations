import 'package:aizacreationzz/AppModules/HomeModule/View/FeaturedView.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/ViewModel/GetPreBookByIdViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrebookByIdViewController extends StatefulWidget {
  final prebookId;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final fromDrawer;

  PrebookByIdViewController(
      {required this.scaffoldKey, this.prebookId, required this.fromDrawer});

  @override
  _PrebookByIdViewControllerState createState() =>
      _PrebookByIdViewControllerState();
}

class _PrebookByIdViewControllerState extends State<PrebookByIdViewController> {
  final controller = Get.put(GetPreBookByIdViewModel());
  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();

    fetchAndSetFuture =
        controller.onGetPreBookById(prebookId: widget.prebookId);
    print("###########33 LENGTH OF SLIDER IS ############");
    print(controller.preBookByIdList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: AppConfig(context: context).width,
      height: AppConfig(context: context).height,
      color: Colors.white,
      child: Column(
        children: [
          customAppBar(
              onSearch: (value) {
                // controller.onSearchTile(value);
              },
              context: context,
              text: "Aiza Creationzz",
              isDrawer: widget.fromDrawer ? false : true,
              scaffoldKey: widget.scaffoldKey),
          Expanded(
            child: FutureBuilder(
                future: fetchAndSetFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none)
                    return Center(
                      child: SpinKitView(themeIsDark: false),
                    );
                  if (!snapshot.hasData)
                    return Center(
                      child: Text("No Data Found"),
                    );
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Obx(
                            () => GridView.builder(
                              shrinkWrap: true,
                              itemCount: controller.preBookByIdList.length,
                              padding: const EdgeInsets.all(4.0),
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.7,
                                      mainAxisSpacing: 5.0,
                                      crossAxisSpacing: 10.0,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => preBookByIDproductTile(
                                    context,
                                    controller.preBookByIdList[index],
                                    () {},
                                    false,
                                    true,
                                    false,
                                  ),
                                );
                              },
                            ),
                            //     Wrap(
                            //   children: controller.categoriesList
                            //       .map((item) => categoryTile(
                            //           context,
                            //           controller,
                            //           item.categoryId,
                            //           controller.categoriesList
                            //               .where((data) =>
                            //                   data.categoryId == item.categoryId)
                            //               .toList()[0]))
                            //       .toList()
                            //       .cast<Widget>(),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
