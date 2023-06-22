import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
class CheckConnectivityServices{
  Future<bool> onConnectivity(BuildContext context)async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      // ShowMessage().showConnectivitySnackBar(connectivityResult, context);
      return true;
    } else {
      ShowMessage().showConnectivitySnackBar(connectivityResult, context);
return false;
    }
  }
}