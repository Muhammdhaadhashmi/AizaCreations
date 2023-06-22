import 'package:aizacreationzz/AppModules/CategoryModule/ViewController/GeneralViewController.dart';
import 'package:aizacreationzz/AppModules/CategoryModule/ViewModel/CategoryViewModel.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/sale_model.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/HomeViewModel.dart';
import 'package:aizacreationzz/AppModules/PreBookedModule/ViewController/PreBookViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsViewController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final fromDrawer;

  CollectionsViewController(
      {required this.scaffoldKey, required this.fromDrawer});

  @override
  _CollectionsViewControllerState createState() =>
      _CollectionsViewControllerState();
}

class _CollectionsViewControllerState extends State<CollectionsViewController> {
   final controller = Get.put(HomeViewModel());
     int _current = 1;
  int lengthOfSlider = 0;
  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();
    fetchAndSetFuture = controller.onGetCategories();
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
                controller.onSearchTile(value);
              },
              context: context,
              text: "Aiza Creationzz",
              isDrawer: widget.fromDrawer ? false : true,
              scaffoldKey: widget.scaffoldKey),
             FutureBuilder<List<sale_model>>(
        future: controller.onGetSales(),
        builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none)
                    return Center(
                      child: SpinKitView(themeIsDark: false),
                    );
                  if (!snapshot.hasData)
                    return Center(
                      child: Text("No Collection Found"),
                    );
             List distinctIds = snapshot.data!.toSet().toList();
        List sliderTypes = [];
         for(int i=0;i<distinctIds.length; i++){
sliderTypes.add(distinctIds[i].slider_type);
         }
var newSliderTypes = sliderTypes.toSet().toList();
         print("&&&&&&&&&&&&7 TESTING DISTINCT IDS &&&&&&&&&&&&&");
        print(newSliderTypes);
          print(controller);
          if (!snapshot.hasData)
            return Center(
              child: SpinKitView(
                themeIsDark: false,
              ),
            );
          if (snapshot.data!.isEmpty) return SizedBox();
return ListView.builder(
  shrinkWrap: true,
  itemCount: newSliderTypes.length,
  itemBuilder: (context,index){
return Builder(
                    builder: (BuildContext context) {
                    
                      return GestureDetector(
                        onTap: () {
                    
                        newSliderTypes[index] == "prebook"
                              ? Get.to(() => AllPreBookedViewController(
                                    scaffoldKey: widget.scaffoldKey,
                                  ))
                              : Get.to(
                                  () => GeneralViewController(
                                    scaffoldKey: widget.scaffoldKey,
                                    fromDrawer: true,
                                    sliderType: snapshot.data![index].slider_type,
                                  ),
                                );
                                
                        },
                        child: 
                          buttonClickView(context,newSliderTypes[index],(){
                             newSliderTypes[index]== "prebook"
                              ? Get.to(() => AllPreBookedViewController(
                                    scaffoldKey: widget.scaffoldKey,
                                  ))
                              : Get.to(
                                  () => GeneralViewController(
                                    scaffoldKey: widget.scaffoldKey,
                                    fromDrawer: true,
                                    sliderType:newSliderTypes[index],
                                  ),
                                );
                        }),
                      );
                    },
                  );
                
}) ;       
//
//return Column(children: snapshot.data!.map((sale) {
      
//         //  var index =  snapshot.data!.indexWhere((element) => element.slider_type != sale.slider_type);
//         //  print(distinctIds[index].slider_type);
//          List newList = [];



// // print(index);
// // if(newList[index] != sale.slider_type){
// //   newList.add(sale.slider_type);
// // }
//                   lengthOfSlider = snapshot.data!.length;
//                   print("&&&&&&&&& CHECKING SLIDER TYPES &&&&&&");
//                   print(snapshot.data);
//                   return Builder(
//                     builder: (BuildContext context) {
                    
//                       return GestureDetector(
//                         onTap: () {
                    
//                           sale.slider_type == "prebook"
//                               ? Get.to(() => AllPreBookedViewController(
//                                     scaffoldKey: widget.scaffoldKey,
//                                   ))
//                               : Get.to(
//                                   () => GeneralViewController(
//                                     scaffoldKey: widget.scaffoldKey,
//                                     fromDrawer: true,
//                                     sliderType: sale.slider_type,
//                                   ),
//                                 );
                                
//                         },
//                         child: 
//                           buttonClickView(context,sale.slider_type,(){
//                              sale.slider_type == "prebook"
//                               ? Get.to(() => AllPreBookedViewController(
//                                     scaffoldKey: widget.scaffoldKey,
//                                   ))
//                               : Get.to(
//                                   () => GeneralViewController(
//                                     scaffoldKey: widget.scaffoldKey,
//                                     fromDrawer: true,
//                                     sliderType: sale.slider_type,
//                                   ),
//                                 );
//                         }),
//                       );
//                     },
//                   );
//                 }).toList());
        
        })
  
      
        ],
      ),
    ));
  }
    Widget buttonClickView(BuildContext context,
      String buttonText, VoidCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10,bottom: 4,top:4),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColor().primaryColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myText(
                  title: buttonText,
                  color: Colors.white,
                  fontweight: FontWeight.w800,
                  size: 16,
                ),
                SizedBox(
                  width: 6,
                ),
             
              ],
            ),
          ],
        ),
      ),
    );
  }


}
