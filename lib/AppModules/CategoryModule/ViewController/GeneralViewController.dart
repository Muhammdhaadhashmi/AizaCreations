import 'package:aizacreationzz/AppModules/CategoryModule/ViewModel/GeneralViewModel.dart';
import 'package:aizacreationzz/AppModules/HomeModule/View/FeaturedView.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/HomeViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralViewController extends StatefulWidget {
  final sliderType;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final fromDrawer;

  GeneralViewController(
      {required this.scaffoldKey, this.sliderType, required this.fromDrawer});

  @override
  _GeneralViewControllerState createState() => _GeneralViewControllerState();
}

class _GeneralViewControllerState extends State<GeneralViewController> {
  final controller = Get.put(GeneralViewModel());
  Future? fetchAndSetFuture;
  final homeController = Get.put(HomeViewModel());

  @override
  void initState() {
    super.initState();
    homeController.onGetProducts();
    print("%%%%%%%%%%%%% CHECKING SLIDER TYPE %%%%%%%%%%%%");
    print(widget.sliderType);
    fetchAndSetFuture = homeController.onGetProducts();
        // controller.onGetSliderData(sliderType: widget.sliderType);
    print("###########33 LENGTH OF SLIDER IS ############");
    print(controller.sliderDataList.length);
    
  }

  @override
  Widget build(BuildContext context) {
      dynamic newList = homeController
                                                            .productsList.where((i) => widget.sliderType == i.p_type).toList();
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
            child:   FutureBuilder(
                          future: fetchAndSetFuture,
                          // future:  controller.onGetProducts(categoryID: widget.categoryID),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting)
                              return Center(
                                child: SpinKitView(themeIsDark: false),
                              );
                            else
                              Center(
                                child: Text("No Product Found"),
                              );
                            // if(!snapshot.hasData)
                            //   return Center(
                            //     child: Text("No Category Found"),
                            //   );
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Container(
                                width: AppConfig(context: context).width,
                                child:  GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: newList.length,
                                          padding: const EdgeInsets.all(4.0),
                                          // physics:
                                          //     NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: 0.6,
                                                  mainAxisSpacing: 10.0,
                                                  crossAxisSpacing: 10.0,
                                                  crossAxisCount: 2),
                                          itemBuilder: (context, index) {
                                            // if(widget.sliderType == homeController.productsList[index].p_type)
                                            // print("&&&&&&&&&& CHECK HOME CONTROLLER INDEX &&&&&&&&");
                                            // print(homeController.productsList[index].p_type);
                                          
                                            return productTile(
                                                  context,
                                                 newList[index],
                                                  () async {
                                                showLoadingIndicator(
                                                    context: context);
                                        
                                           
                                                
                                            
                                              }, false, false, false,
                                                 );
                                         
                                          },
                                        )
                                    //     Wrap(
                                    //   runSpacing: 10,
                                    //   spacing: 10,
                                    //   children: controller.productsList.map((i) {
                                    //     return Builder(
                                    //       builder: (BuildContext context) {
                                    //         return productTile(context, i,(){},false);
                                    //       },
                                    //     );
                                    //   }).toList(),
                                    // ),
                                   
                              ),
                            );
                          }),
          )
                      // FeaturedView(controller: controller,), )
        ],
      ),
    ));
  }
}