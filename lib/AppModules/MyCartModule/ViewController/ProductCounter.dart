import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/MyCartModule/ViewModel/myCartViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types, must_be_immutable
class productCounter extends StatefulWidget {
  Function callBack;
  String totalGuantity;
  String givenGuantity;
  productCounter(
      {required this.callBack,
      required this.givenGuantity,
      required this.totalGuantity});

  @override
  State<productCounter> createState() => _productCounterState();
}

// ignore: camel_case_types
class _productCounterState extends State<productCounter> {
  final controller = Get.put(cart_view_model());
  dynamic quantit;
  dynamic oldQuantity;
  @override
  void initState() {
    super.initState();
    quantit = int.parse(widget.givenGuantity);
    oldQuantity = int.parse(widget.givenGuantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              print("QUANTIT");
              print(quantit);
              oldQuantity = quantit;
              if (quantit > 1)
                setState(() {
                  quantit--;
                  widget.callBack(quantit, oldQuantity);
                });
            },
            icon: Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
          myText(
              title: "$quantit",
              color: AppColor().primaryColor,
              size: 14,
              fontweight: FontWeight.w600),
          IconButton(
            onPressed: () {
              oldQuantity = quantit;

              if (quantit < int.parse(widget.totalGuantity))
                setState(() {
                  quantit++;
                  widget.callBack(quantit, oldQuantity);
                });
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
