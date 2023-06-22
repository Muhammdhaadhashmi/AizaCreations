// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member

import 'dart:convert';

import 'package:aizacreationzz/AppModules/HomeModule/Model/CateGoryModel.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/ProductModel.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavViewModel extends GetxController {
  var favProducts = [].obs;
  var SavedFavProducts = [];
  // List<ProductModel>
  var categorySelectID = 0.obs;
  var categoriesList = [
    // CategoryModel(
    //     categoryId: "1",
    //     categoryImage:
    //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
    //     categoryName: "Men's Fassion",
    //     categoryStatus: "Female Fassion")
  ].obs;

  onGetCategories() async {
    var data = await ApiCall().getRequest(ApisUtills().getAllCategoryUrl);
    print(CategoryModel.decode(data));
    List<CategoryModel> list = CategoryModel.decode(data);
    categoriesList.clear();
    for (int i = 0; i < list.length; i++) {
      categoriesList.add(list[i]);
    }
  }

  getFavProducts() async {
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    var data = await ApiCall().postRequest(ApisUtills().getAllFavProductUrl, {
      "user_id": localUser["user_id"],
    });
    if (data.statusCode == 200) {
      List<ProductModel> list =
          ProductModel.decodePro(jsonDecode(data.body)["data"]);
      favProducts.clear();
      SavedFavProducts.clear();
      for (int i = 0; i < list.length; i++) {
        favProducts.add(list[i]);
        SavedFavProducts.add(list[i]);
      }
      return favProducts.value;
    } else if (data.statusCode == 404) {
      // List<ProductModel> list = ProductModel.decodePro(jsonDecode(data.body)["data"]);
      favProducts.clear();
      SavedFavProducts.clear();
      // for (int i = 0; i < list.length; i++) {
      //   favProducts.add(list[i]);
      //   SavedFavProducts.add(list[i]);
      // }
      return favProducts.value;
    } else {
      return [];
    }
  }

  onFilter({required int id}) {
    print(id);
    print("savedList");
    print(SavedFavProducts);
    if (id == 0) {
      favProducts.value = SavedFavProducts;
    } else {
      favProducts.value =
          SavedFavProducts.where((element) => element.cat_id == id.toString())
              .toList();
    }
  }

  onSearchTile(String value) async {
    favProducts.value = SavedFavProducts;
    favProducts.value = SavedFavProducts.where((string) =>
        string.pro_name.toLowerCase().contains(value.toLowerCase())).toList();
  }

  removeToFav({
    required BuildContext context,
    required String pro_id,
  }) async {
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    var data = {
      "user_id": localUser["user_id"],
      "pro_id": pro_id,
    };
    var response =
        await ApiCall().postRequest(ApisUtills().removeFromFAVUrl, data);
    hideOpenDialog(context: context);
    print(response);
    getFavProducts();
  }
}
