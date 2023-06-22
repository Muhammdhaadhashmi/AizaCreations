// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:aizacreationzz/AppModules/Utils/CheckConnectivity.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SingleProductVM extends GetxController {
  onAddToCart({required BuildContext context, required String pro_id}) async {
    if (await CheckConnectivityServices().onConnectivity(context)) {
      var user = await DatabaseHandler().getCurrentUser();
      print(user);
      var body = {
        "user_id": user["user_id"].toString(),
        "product_id": pro_id,
        "prod_qty": 1,
      };
      print(body);
      var data = await ApiCall().postRequest(ApisUtills().addToCartUrl, body);
      hideOpenDialog(context: context);
      print(data);
      int cartdata = await DatabaseHandler().getCart();
      // String cart= await DatabaseHandler().getCart();
      // int cart=int.parse(myCart!)+1;
      //  myCart=cart.toString();
      if (data.statusCode == 200) {
        await DatabaseHandler().setCart(cartdata + 1);
        ShowMessage().showMessage(context, "Added Successfully");
        return true;
      } else if (data.statusCode == 400) {
        ShowMessage().showMessage(context, "Already Added");
      } else {
        return false;
      }
    }
  }

  onAddToPreBook(
      {required BuildContext context,
      required String pro_id,
      required String prequantity}) async {
    if (await CheckConnectivityServices().onConnectivity(context)) {
      var user = await DatabaseHandler().getCurrentUser();
      print(user);
      var body = {
        "user_id": user["user_id"].toString(),
        "pro_id": pro_id,
        "pro_qty": prequantity,
      };
      print(body);
      var data =
          await ApiCall().postRequest(ApisUtills().confirmprebookUrl, body);
      hideOpenDialog(context: context);
      print(data);
      // int cartdata=await DatabaseHandler().getCart();
      // String cart= await DatabaseHandler().getCart();
      // int cart=int.parse(myCart!)+1;
      //  myCart=cart.toString();
      if (data.statusCode == 200) {
        // await DatabaseHandler().setCart(cartdata+1);
        ShowMessage().showMessage(context, "Added Successfully");
        return true;
      } else if (data.statusCode == 400) {
        ShowMessage().showMessage(context, "Already Added");
      } else {
        return false;
      }
    }
  }

  removeFromPreBook(
      {required BuildContext context,
      required String pb_id,
      required String pro_id,
      required String prequantity}) async {
    if (await CheckConnectivityServices().onConnectivity(context)) {
      var user = await DatabaseHandler().getCurrentUser();
      print(user);
      var body = {
       
        "user_id": user["user_id"].toString(),
        "prebooking_id": pro_id,
        "pb_id":pb_id,
        "prebooking_qty": prequantity,
      };
      print(body);
      var data =
          await ApiCall().postRequest(ApisUtills().removePrebookingUrl, body);
      hideOpenDialog(context: context);
      print(data);
      // int cartdata=await DatabaseHandler().getCart();
      // String cart= await DatabaseHandler().getCart();
      // int cart=int.parse(myCart!)+1;
      //  myCart=cart.toString();
      if (data.statusCode == 200) {
        // await DatabaseHandler().setCart(cartdata+1);
        ShowMessage().showMessage(context, "Removed Successfully");
        return true;
      } else if (data.statusCode == 400) {
        ShowMessage().showMessage(context, "Already Removed");
      } else {
        return false;
      }
    }
  }

  Future<List<String>> onGetProductsImages(
      {required BuildContext context, required String pro_id}) async {
    List<String> images = [];
    if (await CheckConnectivityServices().onConnectivity(context)) {
      var body = {
        "pro_id": pro_id,
      };
      print(body);
      var data =
          await ApiCall().postRequest(ApisUtills().productmultipleUrl, body);
      print("data");
      print(jsonDecode(data.body)["data"]);
      print("################## checking single product vm");
      jsonDecode(data.body);
      images.clear();

      for (int i = 0; i < jsonDecode(data.body)["data"].length; i++) {
        images.add(jsonDecode(data.body)["data"][i]["p_images"]);
      }
      print("images");
      print(images);
      return images;
    }
    return [];
  }
}
