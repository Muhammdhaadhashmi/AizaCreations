// ignore_for_file: camel_case_types, unused_field

import 'package:aizacreationzz/AppModules/CategoryModule/ViewController/GeneralViewController.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/sale_model.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/HomeViewModel.dart';
import 'package:aizacreationzz/AppModules/PreBookedModule/ViewController/PreBookViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class carousel_slider extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  carousel_slider({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _carousel_sliderState createState() => _carousel_sliderState();
}

class _carousel_sliderState extends State<carousel_slider> {
  final controller = Get.put(HomeViewModel());
  int _current = 1;
  int lengthOfSlider = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<sale_model>>(
        future: controller.onGetSales(),
        builder: (context, snapshot) {
          print(controller);
          if (!snapshot.hasData)
            return Center(
              child: SpinKitView(
                themeIsDark: false,
              ),
            );
          if (snapshot.data!.isEmpty) return SizedBox();
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 4,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeIn,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  aspectRatio: 2.0,
                  disableCenter: true,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: snapshot.data!.map((sale) {
                  lengthOfSlider = snapshot.data!.length;
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          print("########## CHECKING SLIDER TYPE #########");
                          print(sale.slider_status);
                          print(sale.slider_id);
                          print(sale.slider_img);
                          print(sale.slider_type);
                          sale.slider_type == "prebook"
                              ? Get.to(() => AllPreBookedViewController(
                                    scaffoldKey: widget.scaffoldKey,
                                  ))
                              : Get.to(
                                  () => GeneralViewController(
                                    scaffoldKey: widget.scaffoldKey,
                                    fromDrawer: true,
                                    sliderType: sale.slider_type,
                                  ),
                                );
                                
                        },
                        child: _sizedContainer(
                          
                          CachedNetworkImage(
                            fit: BoxFit.fill,
                                        imageUrl :ApisUtills().imageUrl +
                                            "${sale.slider_img}"),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              //added
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(lengthOfSlider.toString()),
              //   ],
              // )

              // Container(
              //   width: 5,
              //   height: 5,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.deepPurpleAccent,
              //   ),
              // ),
            ],
          );
        });
  }
   Widget _sizedContainer(Widget child) {
    return SizedBox(
      width: AppConfig(context: context).width - 40,
      height: 200.0,
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: child),
      ),
    );
  }
  
}
