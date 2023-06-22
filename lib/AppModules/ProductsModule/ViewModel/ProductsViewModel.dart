import 'package:aizacreationzz/AppModules/HomeModule/Model/CateGoryModel.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/ProductModel.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductsViewModel extends GetxController {
  var categorySelectID = 0.obs;
  var categoriesList = [
    // CategoryModel(
    //     categoryId: "1",
    //     categoryImage:
    //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
    //     categoryName: "Men's Fassion",
    //     categoryStatus: "Female Fassion")
  ].obs;
  List<ProductModel> savedList = [
    // ProductModel(
    //     pro_color: "pro_color",
    //     pro_discount: "20",
    //     pro_discription: "this is description",
    //     pro_id: "0",
    //     pro_image:
    //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
    //     pro_name: "Astylish Shoe",
    //     pro_price: "100",
    //     pro_quantity: "10",
    //     pro_size: "10",
    //     pro_status: "Status")
  ];
  var productsList = [
    // ProductModel(
    //     pro_color: "pro_color",
    //     pro_discount: "20",
    //     pro_discription: "this is description",
    //     pro_id: "0",
    //     pro_image:
    //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
    //     pro_name: "Astylish Shoe",
    //     pro_price: "100",
    //     pro_quantity: "10",
    //     pro_size: "10",
    //     pro_status: "Status")
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

  onGetProducts({int categoryID = 0}) async {
    var data;
    if (categoryID != 0) {
      print("Product by id");
      data = await ApiCall().getRequest(
          ApisUtills().productByCatgoryIdUrl + "${categoryID.toString()}");
    } else {
      print("Product all");
      data = await ApiCall().getRequest(ApisUtills().getAllProductUrl);
    }
    if (data != "") {
      List<ProductModel> list = ProductModel.decodePro(data["data"]);
      productsList.clear();
      savedList.clear();

      for (int i = 0; i < list.length; i++) {
        productsList.add(list[i]);
        savedList.add(list[i]);
      }
      print("##############33 PRODUCT LIST #################");
      print(productsList);
      return productsList;
    } else {
      return [];
    }
  }

  onFilter({required int id}) {
    print(id);
    print("savedList");
    print(savedList);
    if (id == 0) {
      productsList.value = savedList;
    } else {
      productsList.value = savedList
          .where((element) => element.cat_id == id.toString())
          .toList();
    }
  }

  onSearchTile(String value) async {
    productsList.value = savedList;
    productsList.value = savedList
        .where((string) =>
            string.pro_name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  // ignore: non_constant_identifier_names
  Future<bool> AddToFav({
    required BuildContext context,
    // ignore: non_constant_identifier_names
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
