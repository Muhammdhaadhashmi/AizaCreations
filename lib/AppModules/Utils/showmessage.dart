
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ShowMessage {
  showConnectivitySnackBar(ConnectivityResult result,BuildContext context) {

    final hasInternet = result != ConnectivityResult.none;

    if(!hasInternet){
      showErrorMessage(context, "Failed Internet Connection",);

    }else{
      showMessage(context, "Internet Connection Succeed",);

    }

  }
  showMessage(
    BuildContext context,
    String message,
  ) {
    return showToast(
      '$message',
      textStyle: TextStyle(color: AppColor().primaryColor),
      context: context,
      animation: StyledToastAnimation.slideFromTop,
      backgroundColor:Colors.white,

      dismissOtherToast: true,
      position: StyledToastPosition.top,
    );
  }

  showErrorMessage(BuildContext context, String message) {
    return showToast(
      '$message',
      context: context,
      animation: StyledToastAnimation.slideFromTop,
      backgroundColor: Colors.red,
      dismissOtherToast: true,
      position: StyledToastPosition.top,
    );
  }
}
