import 'package:flutter/material.dart';

class FunkyOverlay extends StatefulWidget {
  // List<dynamic> dataList;
  // String title;
  // BuildContext context;
  // Function OnCallBack;
  // bool isIcon = true;
  //
  // // FunkyOverlay(
  // //     {required this.title, required this.context, required this.dataList, required this.isIcon, required this.OnCallBack});

  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation!,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
                height: 500,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Column(
                  children: [],
                )),
          ),
        ),
      ),
    );
  }
}
