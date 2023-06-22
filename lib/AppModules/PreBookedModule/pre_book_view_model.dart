// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:aizacreationzz/AppModules/HomeModule/Model/ProductModel.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class pre_book_view_model extends GetxController {
  RxInt currentIndex = 0.obs;
  var productsList = [].obs;
  var savedList = [].obs;
  var myprebook = [].obs;
  var savedmyprebook = [].obs;
  onSearchPrebook(String value) async {
    productsList.value = savedList;
    productsList.value = savedList
        .where((string) =>
            string.pro_name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  onSearchMyPrebook(String value) async {
    myprebook.value = savedList;
    myprebook.value = savedList
        .where((string) =>
            string.pro_name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  onGetProducts() async {
    var data = await ApiCall().getRequest(ApisUtills().preBookingListUrl);
    productsList.clear();
    savedList.clear();
    for (int i = 0; i < data["data"].length; i++) {
      productsList.add(
        ProductModel(
          isliked: false,
          pb_id: data["data"][i]["pb_id"] ?? "",
          pro_color: data["data"][i]["pre_color"] ?? "",
          pro_discount: data["data"][i]["pre_discount"] ?? "",
          pro_discription: data["data"][i]["pre_discription"] ?? "",
          pro_Id: data["data"][i]["pre_id"] ?? "",
          pro_image: data["data"][i]["pre_image"] ?? "",
          pro_name: data["data"][i]["pre_name"] ?? "",
          pro_price: data["data"][i]["pre_price"] ?? "",
          pro_quantity: data["data"][i]["pre_qty"] ?? "",
          pro_size: data["data"][i]["pre_size"] ?? "",
          pro_status: data["data"][i]["pre_status"] ?? "",
          pro_preqty: data["data"][i]["pro_preqty"] ?? "",
          pre_saleqty: data["data"][i]["pre_saleqty"] ?? "",
          pro_presale: data["data"][i]["pro_presale"] ?? "",
          cat_id: data["data"][i]["cat_id"] ?? "",
          pro_video: data["data"][i]["pre_video"] ?? "",
        ),
      );
    }

    savedList = productsList;
    print(productsList);
    print(savedList);
    //
    // List<ProductModel> list = ProductModel.decodePro(data["data"]);
    // productsList.clear();
    // savedList.clear();
    // for (int i = 0; i < list.length; i++) {
    //   productsList.add(list[i]);
    //   savedList.add(list[i]);
    // }
  }

  onGetmyPrebook() async {
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    var data = await ApiCall().postRequest(ApisUtills().myPreBookingListUrl,
        {"user_id": "${localUser["user_id"]}"});
    print("my pre book");

    var jsonData = jsonDecode(data.body)["data"];
    print(jsonData);
    myprebook.clear();
    savedmyprebook.clear();
    for (int i = 0; i < jsonData.length; i++) {
      myprebook.add(
        ProductModel(
          isliked: false,
          pb_id: jsonData[i]["pb_id"] ?? "",
          pro_color: jsonData[i]["pre_color"] ?? "",
          pro_discount: jsonData[i]["pre_discount"] ?? "",
          pro_discription: jsonData[i]["pre_discription"] ?? "",
          pro_Id: jsonData[i]["pre_id"] ?? "",
          pro_image: jsonData[i]["pre_image"] ?? "",
          pro_name: jsonData[i]["pre_name"] ?? "",
          pro_price: jsonData[i]["pre_price"] ?? "",
          pro_quantity: jsonData[i]["prebooking_qty"] ?? "",
          pro_size: jsonData[i]["pre_size"] ?? "",
          pro_status: jsonData[i]["pre_status"] ?? "",
          pro_preqty: jsonData[i]["pro_preqty"] ?? "",
          pre_saleqty: jsonData[i]["pre_saleqty"] ?? "",
          pro_presale: jsonData[i]["pro_presale"] ?? "",
          cat_id: jsonData[i]["cat_id"] ?? "",
          pro_video: jsonData[i]["pre_video"] ?? "",
          prebooking_date: jsonData[i]["prebooking_date"] ?? "",
        ),
      );
    }

    savedmyprebook = myprebook;
    print(myprebook);
    print(savedmyprebook);
    //  List<ProductModel> list
    // = ProductModel.decodePre(data["data"]);
    //
    // // print(data["data"]);
    // myprebook.clear();
    // savedmyprebook.clear();
    // for (int i = 0; i < list.length; i++) {
    //   myprebook.add(list[i]);
    //   savedmyprebook.add(list[i]);
    // }
  }

  Future<bool> AddToFav({
    required BuildContext context,
    required String pro_id,
  }) async {
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    print("liked");
    var data = {
      "user_id": localUser["user_id"],
      "pro_id": pro_id,
    };
    var response = await ApiCall().postRequest(ApisUtills().addToFAVUrl, data);
    hideOpenDialog(context: context);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
