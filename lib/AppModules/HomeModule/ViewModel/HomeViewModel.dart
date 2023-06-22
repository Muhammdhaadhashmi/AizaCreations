// ignore_for_file: non_constant_identifier_names

import 'package:aizacreationzz/AppModules/HomeModule/Model/CateGoryModel.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/ProductModel.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/sale_model.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var sales_list = [].obs;
  var get_discount_list = [].obs;
  RxInt cartNum = 0.obs;

  var categoriesList = [
    // CategoryModel(
    //     categoryId: "1",
    //     categoryImage:
    //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
    //     categoryName: "Men's Fassion",
    //     categoryStatus: "Female Fassion")
  ].obs;
  List<ProductModel> savedList = [];
  var productsList = [].obs;
  var discount_list = [].obs;

  onGetCategories() async {
    var data = await ApiCall().getRequest(ApisUtills().getAllCategoryUrl);
    // print(CategoryModel.decode(data));
    List<CategoryModel> list = CategoryModel.decode(data);
    categoriesList.clear();
    for (int i = 0; i < list.length; i++) {
      categoriesList.add(list[i]);
    }
  }

  onGetProducts() async {
    var data = await ApiCall().getRequest(ApisUtills().getAllProductUrl);
    print("products");
    print(data["data"]);
    List<ProductModel> list = ProductModel.decodePro(data["data"]);
    productsList.clear();
    savedList.clear();
    for (int i = 0; i < list.length; i++) {
      productsList.add(list[i]);
      savedList.add(list[i]);
      // if (int.parse(list[i].pro_discount) != 0) {
      //   discount_list.add(list[i].pro_discount);
      // }
      // print(productsList[i].pro_discount);
    }
    return productsList;
    // print("DISCOUNT LIST ###############");
    // print(discount_list);
    // for (int i = 0; i < list.length; i++) {
    //   get_discount_list.add(100 -
    //       int.parse(list[i].pro_discount) / int.parse(list[i].pro_price) * 100);
    // }
    // print(get_discount_list);
  }

  Future<List<sale_model>> onGetSales() async {
    var data = await ApiCall().getRequest(ApisUtills().sliderUrl);

    List<sale_model> list = sale_model.decode(data["data"]);
    sales_list.clear();

    for (int i = 0; i < list.length; i++) {
      sales_list.add(list[i]);
    }
    return list;
  }

  onSearchTile(String value) async {
    productsList.value = savedList;
    productsList.value = savedList
        .where((string) =>
            string.pro_name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  Future<bool> addToFav({
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
    } else if (response.statusCode == 400) {
      return false;
    } else {
      return false;
    }
  }
}
