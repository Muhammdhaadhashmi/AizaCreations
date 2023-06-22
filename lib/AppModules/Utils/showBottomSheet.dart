// import 'package:flutter/material.dart';
// void showModal(context,List<Bank> listOfValue, Function callback){
//   showModalBottomSheet(
//       context: context,
//       builder: (context){
//         return Container(
//           padding: EdgeInsets.all(8),
//           height: 300,
//           alignment: Alignment.center,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ListView.separated(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: listOfValue.length,
//                 separatorBuilder: (context, int) {
//                   return Divider();
//                 },
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                       child: Text("1"),
//                       onTap: () {
//                         // setState(() {
//                         //   selectedindex=index;
//                         //   print(selectedindex);
//                           // _selectedValue= listOfValue[index];
//                           // print(_selectedValue);
//                         // });
//                         callback(index);
//                         Navigator.of(context).pop();
//                       }
//                   );
//                 }
//             ),
//           ),
//         );
//       });}