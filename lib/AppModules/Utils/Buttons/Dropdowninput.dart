// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:self/AppModule/Utils/TextView/TextView.dart';
//
// class DropDownInput extends StatefulWidget {
//   String label;
//   List<String> menulist=['1', '2', '3', '4', '5'];
//   Function callback;
//   String slecteditem;
//   DropDownInput({
//     this.callback,
//     this.label,this.menulist,this.slecteditem
//   });
//
//   @override
//   _DropDownInputState createState() => _DropDownInputState();
// }
//
// class _DropDownInputState extends State<DropDownInput> {
//
//
//   String _selectedValue="Choose One";
//   int selectedindex=0;
//   List<String> listOfValue = ['1', '2', '3', '4', '5'];
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//       height: 55,
//       child: DropdownButtonFormField(
//         value:listOfValue[selectedindex],
//         // hint: Text(
//         //     listOfValue[selectedindex],
//         // ),
// icon: Padding(
//   padding: const EdgeInsets.only(top: 10),
//   child: GestureDetector( onTap: (){
//     // showModal(context);
//   },child: Icon(Icons.arrow_drop_down_outlined)),
// ) ,
//         isExpanded: true,
//
//         decoration: InputDecoration(
//
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(color: Colors.red),
//               // borderRadius: BorderRadius.only(
//               //   topRight: Radius.elliptical(120, 120),
//               // ),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide:  BorderSide(color: Colors.grey),
//               // borderRadius: BorderRadius.only(
//               //   topRight: Radius.elliptical(120, 120),
//               // ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(color: Colors.grey),
//               // borderRadius: BorderRadius.only(
//               //   topRight: Radius.elliptical(120, 120),
//               // ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(color: Colors.grey),
//               // borderRadius: BorderRadius.only(
//               //   topRight: Radius.elliptical(120, 120),
//               // ),
//             ),
//           filled: false,
//           hintText: 'Choose Country',
//           prefixIcon: Icon(Icons.location_on),
//
//           labelText:"hello"
//
//         ),
//         onChanged: (value) {
//           setState(() {
//             _selectedValue = value;
//           });
//         },
//
//         onSaved: (value) {
//           setState(() {
//             _selectedValue = value;
//           });
//         },
//         validator: (String value) {
//           if (value.isEmpty) {
//             return "can't empty";
//           } else {
//             return null;
//           }
//         },
//         // iconEnabledColor: Colors.transparent,
//
//         // onTap: (){
//         //   showModal(context);
//         // },
//         focusNode: FocusNode(),
//
//         items:
//         listOfValue
//             .map((String val) {
//           return
//             DropdownMenuItem(
//               onTap: (){
//
//               },
//             value: val,
//             child: Text(
//               val,
//             ),
//           );
//         }).toList(),
//       ),
//     );
//     //   Container(
//     //   height: 50,
//     //   width: MediaQuery.of(context).size.width - 50,
//     //   decoration: BoxDecoration(
//     //     color: Colors.transparent,
//     //     borderRadius: BorderRadius.circular(5),
//     //     border: Border.all(color: Colors.blue[900]),
//     //   ),
//     //   child: Padding(
//     //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//     //     child: Row(
//     //       children: [
//     //         Expanded(
//     //           child:
//     //
//     //           // DropdownButton<String>(
//     //           //   value: widget.country,
//     //           //   icon: Row(
//     //           //     mainAxisAlignment: MainAxisAlignment.end,
//     //           //     children: [
//     //           //
//     //           //       SizedBox(
//     //           //         width: 120,
//     //           //       ),
//     //           //       const Icon(
//     //           //         Icons.keyboard_arrow_down_rounded,
//     //           //         color: Colors.blue,
//     //           //         size: 30,
//     //           //       ),
//     //           //     ],
//     //           //   ),
//     //           //   elevation: 16,
//     //           //   style: TextStyle(color: Colors.blue[900]),
//     //           //   underline: Container(height: 1, color: Colors.transparent),
//     //           //   onChanged: widget.callback,
//     //           //   items: widget.countryList
//     //           //       .map<DropdownMenuItem<String>>((String value) {
//     //           //     return DropdownMenuItem<String>(
//     //           //       value: value,
//     //           //       child: Text(
//     //           //         value,
//     //           //         style: TextStyle(
//     //           //           color: Colors.grey[500],
//     //           //         ),
//     //           //       ),
//     //           //     );
//     //           //   }).toList(),
//     //           // ),
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
//   // void showModal(context){
//   //   showModalBottomSheet(
//   //       context: context,
//   //       builder: (context){
//   //     return Container(
//   //       padding: EdgeInsets.all(8),
//   //       height: 300,
//   //       alignment: Alignment.center,
//   //       child: Padding(
//   //         padding: const EdgeInsets.all(10.0),
//   //         child: ListView.separated(
//   //           physics: NeverScrollableScrollPhysics(),
//   //             itemCount: listOfValue.length,
//   //             separatorBuilder: (context, int) {
//   //               return Divider();
//   //             },
//   //             itemBuilder: (context, index) {
//   //               return GestureDetector(
//   //                   child: Text(listOfValue[index]),
//   //                   onTap: () {
//   //                     setState(() {
//   //                       selectedindex=index;
//   //                       _selectedValue= listOfValue[index];
//   //                       print(_selectedValue);
//   //                     });
//   //                     Navigator.of(context).pop();
//   //                   }
//   //               );
//   //             }
//   //         ),
//   //       ),
//   //     );
//   //   });}
// }
