import 'package:aizacreationzz/AppModules/HomeModule/Model/CateGoryModel.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController {
  var categoriesSavedList = [
    CategoryModel(
        categoryId: "1",
        categoryImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
        categoryName: "Men's Fassion",
        categoryStatus: "Female Fassion")
  ].obs;
  var categoriesList = [
    CategoryModel(
        categoryId: "1",
        categoryImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
        categoryName: "Men's Fassion",
        categoryStatus: "Female Fassion")
  ].obs;
  onGetCategories() async {
    var data = await ApiCall().getRequest(ApisUtills().getAllCategoryUrl);

    List<CategoryModel> list = CategoryModel.decode(data);
    categoriesList.clear();
    categoriesSavedList.clear();
    for (int i = 0; i < list.length; i++) {
      categoriesList.add(list[i]);
      categoriesSavedList.add(list[i]);
    }
    return categoriesList;
  }

  onSearchTile(String value) async {
    categoriesList.value = categoriesSavedList;
    categoriesList.value = categoriesSavedList
        .where((string) =>
            string.categoryName.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
