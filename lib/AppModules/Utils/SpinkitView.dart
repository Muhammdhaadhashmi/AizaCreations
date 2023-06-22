import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class SpinKitView extends StatefulWidget {
  bool themeIsDark = true;
  SpinKitView({
    required this.themeIsDark,
  });

  @override
  State<SpinKitView> createState() => _SpinKitViewState();
}

class _SpinKitViewState extends State<SpinKitView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: widget.themeIsDark ? AppColor().primaryColor : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SpinKitFadingFour(
          // SpinKitFoldingCube(
          // SpinKitHourGlass(
          SpinKitFadingCircle(
            size: 35,
            color: widget.themeIsDark ? Colors.white : AppColor().primaryColor,
          ),
        ],
      ),
    );
  }
}

void showLoadingIndicator(
    {required BuildContext context, bool isDark = false}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 50,
        width: 50,
        color: Colors.transparent,
        child: SpinKitFadingCircle(
          size: 35,
          color: isDark ? Colors.white : AppColor().primaryColor,
        ),
      );
    },
  );
}

void hideOpenDialog({
  required BuildContext context,
}) {
  Navigator.of(context).pop();
}

Widget spinKitButton(BuildContext context, double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      gradient: LinearGradient(colors: [
        // Colors.blue[500],
        Color(0xFF014182),
      ]),
    ),
    child: Center(
      child: SpinKitFadingCircle(
        size: 25,
        color: Colors.white,
      ),
    ),
  );
}
