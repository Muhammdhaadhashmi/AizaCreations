import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';

//
// class ShippingAddress extends StatelessWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//         floatingActionButton: Padding(
//           padding: const EdgeInsets.only(bottom: 50),
//           child: FloatingActionButton(
//               child: Icon(Icons.add, color: Colors.white),
//               backgroundColor: AppColor().primaryColor,
//               onPressed: () {
//                 Get.to(() => CreateAddress());
//               }),
//         ),
//         body: Container(
//           height: AppConfig(context: context).height,
//           width: AppConfig(context: context).width,
//           child: Column(
//             children: [
//               customAppBar(
//                   onSearch: (value){
//
//                   },
//                 scaffoldKey: scaffoldKey,
//                   context: context,
//                   text: "Shipping Address",
//                   isDrawer: false,
//                   isSearch: false,
//                   isCart: false),
//               Expanded(child: ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return addressTile(
//                     context: context,
//                   );
//                 },
//               )),
//               SizedBox(
//                 height: 10,
//               ),
//               CustomButton(
//                   text: "Continue",
//                   callback: () {
//                     Get.to(() => CheckoutViewController());
//                   },
//                   height: 45,
//                   textColor: Colors.white,
//                   width: AppConfig(context: context).width - 50,
//                   btnColor: AppColor().primaryColor,
//                   borderColor: Colors.transparent),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ));
//   }
// }

Widget addressTile({required BuildContext context, bool isCheck = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: AppConfig(context: context).width,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black45),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: AppConfig(context: context).width - 100,
                  child: myText(
                      txtalign: TextAlign.start,
                      title:
                          "Address Shewrapara, Mirpur, \nDhaka-1216\n House no: 938\n Road no: 9",
                      color: AppColor().primaryColor,
                      size: 14,
                      fontweight: FontWeight.w600),
                ),
              ],
            ),
            Checkbox(value: isCheck ? true : true, onChanged: (value) {}),
          ],
        ),
      ),
    ),
  );
}
