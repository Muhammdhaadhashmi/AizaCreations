import 'package:aizacreationzz/AppModules/PreBookedModule/ViewController/PreBookByIdViewController.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/ViewModel/GetPreBookAdViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreBookAdViewController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  PreBookAdViewController({
    required this.scaffoldKey,
  });

  @override
  _PreBookAdViewControllerState createState() =>
      _PreBookAdViewControllerState();
}

class _PreBookAdViewControllerState extends State<PreBookAdViewController> {
  final controller = Get.put(GetPreBookAdViewModel());
  DateTime date = DateTime.now();
  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();
    fetchAndSetFuture = controller.onGetPreBookAdList();
    print("############==== Videos List ###############");
    print(controller.preBookAdList);
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
                      child: Text("No PreBooking Found"),
                    );

                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Obx(() => Container(
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.preBookAdList.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  DateTime checkDate = DateTime.parse(
                                      '${controller.preBookAdList[index]["pre_lunchdate"]} ${controller.preBookAdList[index]["pre_time"]}');
                                  print(
                                      "&&&&&&&&&&& CHECK LAUNCH DATE &&&&&&&&&&&&&&");
                                  print(controller.preBookAdList[index]
                                          ["pre_lunchdate"] +
                                      controller.preBookAdList[index]
                                          ["pre_time"]);
                                  print(checkDate.isBefore(DateTime.now()));
                                  if (checkDate.isBefore(DateTime.now())) {
                                    return Container(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, bottom: 30.0),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: GestureDetector(
                                            onTap: () async {
                                              Get.to(
                                                () => PrebookByIdViewController(
                                                  scaffoldKey:
                                                      widget.scaffoldKey,
                                                  fromDrawer: true,
                                                  prebookId: controller
                                                          .preBookAdList[index]
                                                      ["pre_bid"],
                                                ),
                                              );
                                              // await launch(
                                              //     controller.preBookAdList[index]
                                              //         ["video_link"]);
                                            },
                                            child: Column(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        child: Container(
                                                          child: ColorFiltered(
                                                            colorFilter:
                                                                ColorFilter.mode(
                                                                    Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.3),
                                                                    BlendMode
                                                                        .darken),
                                                            child: Image(
                                                              image:
                                                                  NetworkImage(
                                                                controller
                                                                            .preBookAdList[index][
                                                                                "pre_adimg"]
                                                                            .isNotEmpty ||
                                                                        controller.preBookAdList[index]["pre_adimg"](
                                                                            ".")
                                                                    ? ApisUtills()
                                                                            .imageUrl +
                                                                        "${controller.preBookAdList[index]["pre_adimg"]}"
                                                                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",

                                                                // "${widget.controller!.categoriesList[index].categoryImage}",
                                                              ),
                                                              fit: BoxFit.cover,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  6,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      right: 0,
                                                      bottom: 0,
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: myText(
                                                          txtalign:
                                                              TextAlign.center,
                                                          maxLines: 4,
                                                          softWrap: true,
                                                          txtOverFlow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          title:
                                                              "${controller.preBookAdList[index]["pre_adtitle"]}"
                                                                  .toUpperCase(),
                                                          color: Colors.white,
                                                          fontweight:
                                                              FontWeight.w900,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          ),
                        )),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
