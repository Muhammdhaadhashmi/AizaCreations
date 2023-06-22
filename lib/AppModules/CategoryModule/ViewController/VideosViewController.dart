import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/GetVideosViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class VideosViewController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  VideosViewController({
    required this.scaffoldKey,
  });

  @override
  _VideosViewControllerState createState() => _VideosViewControllerState();
}

class _VideosViewControllerState extends State<VideosViewController> {
  final controller = Get.put(GetVideosViewModel());

  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();
    fetchAndSetFuture = controller.onGetVideosList();
    print("############==== Videos List ###############");
    print(controller.videoList);
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
            scaffoldKey: widget.scaffoldKey,
          ),
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
                      child: Text("No Video Found"),
                    );
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Obx(() => Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  myText(
                                    txtalign: TextAlign.center,
                                    title: "Videos".toUpperCase(),
                                    color: AppColor().primaryColor,
                                    fontweight: FontWeight.w800,
                                    size: 27,
                                  ),
                                ],
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.videoList.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
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
                                            await launch(
                                                controller.videoList[index]
                                                    ["video_link"]);
                                          },
                                          child: Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(8),
                                                        bottomRight:
                                                            Radius.circular(8),
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
                                                            image: NetworkImage(
                                                              controller
                                                                          .videoList[
                                                                              index]
                                                                              [
                                                                              "video_img"]
                                                                          .isNotEmpty ||
                                                                      controller
                                                                              .videoList[index]["video_img"](
                                                                          ".")
                                                                  ? ApisUtills()
                                                                          .imageUrl +
                                                                      "${controller.videoList[index]["video_img"]}"
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
                                                    bottom: 0,
                                                    top: 0,
                                                    left: 0,
                                                    right:
                                                        0, //give the values according to your requirement
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 4, top: 10),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: myText(
                                                        txtalign:
                                                            TextAlign.start,
                                                        maxLines: 4,
                                                        softWrap: true,
                                                        txtOverFlow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        title:
                                                            "${controller.videoList[index]["video_title"]}"
                                                                .toUpperCase(),
                                                        color: Colors.black,
                                                        fontweight:
                                                            FontWeight.w800,
                                                        size: 15,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
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
