import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

showNumberPicker(context,int selectedNumber ,Function callback){
  var myValue=50;
  return showModalBottomSheet(
      context: context,
      builder: (context){
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(8),
              height: 300,
              width: 300,
              alignment: Alignment.center,
              child: NumberPicker(

                value:myValue,
                minValue: 1,
                maxValue: 1000,

                onChanged: (value) {

                  setState((){
                    myValue=value;
                    print(myValue);
                  });
                  callback(value);
                },
              ),

            );
          },
        );
      });
}