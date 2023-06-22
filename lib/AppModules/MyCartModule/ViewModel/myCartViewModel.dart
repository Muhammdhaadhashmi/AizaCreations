// ignore_for_file: non_constant_identifier_names

import 'package:aizacreationzz/AppModules/AppRootPage/AppRootPage.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/HomeViewModel.dart';
import 'package:aizacreationzz/AppModules/MyCartModule/Model/CartModel.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class cart_view_model extends GetxController {
  var isLoading = false.obs;
  var cartList = [].obs;

// var totalPrice=0.obs;
  RxDouble totalPrice = 0.0.obs;

  Future<List<Cart>> onGetCart() async {
    List<Cart> list = [];
    var user = await DatabaseHandler().getCurrentUser();

    var data = await ApiCall()
        .getRequest(ApisUtills().getCartListUrl + "${user["user_id"]}");
    print("data");
    print(data);
    if (data != "") {
      list = Cart.decode(data["data"]);
      cartList.clear();

      for (int i = 0; i < list.length; i++) {
        // totalPrice.value=totalPrice.value+int.parse(list[i].pro_price);
        cartList.add(list[i]);
        // totalPrice.value=(totalPrice.value+getPrice(list[i].pro_discount, list[i].pro_price)).toInt();
      }
      await DatabaseHandler().setCart(list.length);
      Get.find<HomeViewModel>().cartNum.value = list.length;
    } else {
      cartList.clear();
      //
      // for (int i = 0; i < list.length; i++) {
      //   // totalPrice.value=totalPrice.value+int.parse(list[i].pro_price);
      //   cartList.add(list[i]);
      // }
      await DatabaseHandler().setCart(0);
      Get.find<HomeViewModel>().cartNum.value = 0;
    }
    setPrice();

    return list;
  }

  updatePrice({required double price, required bool isAdd}) {
    print("THIS IS TOTAL PRICE");
    print(totalPrice.value);
    if (isAdd) {
      totalPrice.value = totalPrice.value + price;
    } else {
      totalPrice.value = totalPrice.value - price;
    }
  }

  setPrice() {
    totalPrice.value = 0.0;
    print("Length of cart");
    // ignore: invalid_use_of_protected_member
    print(cartList.value.length);
    // ignore: invalid_use_of_protected_member
    for (int i = 0; i < cartList.value.length; i++) {
      totalPrice.value = (totalPrice.value +
              // ignore: invalid_use_of_protected_member
              (getPrice(
                      // ignore: invalid_use_of_protected_member
                      cartList.value[i].pro_discount,
                      // ignore: invalid_use_of_protected_member
                      cartList.value[i].pro_price) *
                  // ignore: invalid_use_of_protected_member
                  int.parse(cartList.value[i].prodQty)))
          .toDouble();
    }
  }

  onEditCart({required String product_id, required String product_qty}) async {
    // isLoading.value=true;
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    // var body = {
    //   "user_id": "${localUser["user_id"].toString()}",
    //   "product_id": product_id,
    //   "prod_qty": product_qty,
    // };
    // String input = '{"accessCode":"ID","pager":{"start":0,"count":2147483647}}';
    http.Response response = await http.put(
      Uri.parse("${ApisUtills().baseUrl + ApisUtills().editCartUrl}"),
      body:
          "user_id=${localUser["user_id"]}&product_id=$product_id&prod_qty=$product_qty",
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      encoding: Encoding.getByName("utf-8"),
    );
    print(jsonDecode(response.body));

    // isLoading.value=false;
  }

  onRemoveCart(
      {required String product_id, required BuildContext context}) async {
    // isLoading.value=true;
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    var body = {
      "user_id": "${localUser["user_id"].toString()}",
      "product_id": product_id,
    };
    var response =
        await ApiCall().postRequest(ApisUtills().deleteCartUrl, body);
    hideOpenDialog(context: context);
    if (response.statusCode == 200) {
      onGetCart();
    }
    // String input = '{"accessCode":"ID","pager":{"start":0,"count":2147483647}}';
    // http.Response response = await http.put(
    //   Uri.parse("${ApisUtills().baseUrl + ApisUtills().editCartUrl}"),
    //   body:
    //       "user_id=${localUser["user_id"]}&product_id=${product_id}&prod_qty=${product_qty}",
    //   headers: {"Content-Type": "application/x-www-form-urlencoded"},
    //   encoding: Encoding.getByName("utf-8"),
    // );
    // print(jsonDecode(response.body));

    // isLoading.value=false;
  }

  getPrice(String discount, String price) {
    int dis = 0;
    if (discount.isNotEmpty && int.parse(discount) != 0) {
      dis = int.parse(discount);
    }

    return dis == 0 ? int.parse(price) : dis;
  }

  onBuyCart({required BuildContext context}) async {
    isLoading.value = true;
    showLoadingIndicator(context: context);
    var localUser = await DatabaseHandler().getCurrentUser();

    print(localUser["user_id"]);
    var body = {
      "user_id": "${localUser["user_id"].toString()}",
    };
    var response = await ApiCall().postRequest(ApisUtills().buyCartUrl, body);
    hideOpenDialog(context: context);
    isLoading.value = false;
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      await DatabaseHandler().setCart(0);
      Get.find<HomeViewModel>().cartNum.value = 0;
      ShowMessage().showMessage(
          context, "Congratulations! Your Order Placed Successfully");
      Get.offAll(() => AppRootPage());
    }
  }
}
