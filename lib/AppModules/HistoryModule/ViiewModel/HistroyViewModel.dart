import 'dart:convert';

import 'package:aizacreationzz/AppModules/HistoryModule/Model/OrderDetailModel.dart';
import 'package:aizacreationzz/AppModules/HistoryModule/Model/OrderModel.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:get/get.dart';

class HistoryViewModel extends GetxController {
  var index = 0.obs;
  var orderList = [].obs;
  var singleOrderList = [].obs;
  var savedOrderList = [].obs;

  onSearchMyPrebook(String value) async {
    orderList.value = savedOrderList;
    orderList.value =
        savedOrderList.where((string) => string.pdate.contains(value)).toList();
  }

  onGetOrders() async {
    var localUser = await DatabaseHandler().getCurrentUser();
    print(localUser["user_id"]);
    var data = await ApiCall().postRequest(
        ApisUtills().myOrderUrl, {"user_id": "${localUser["user_id"]}"});

    orderList.clear();
    savedOrderList.clear();
    // for (int i = jsonDecode(data.body)["data"].length; i >1; i--) {
    for (int i = 0; i < jsonDecode(data.body)["data"].length; i++) {
      orderList.add(
        OrderModel(
          totalprice: jsonDecode(data.body)["data"][i]["totalprice"] ?? "",
          pdate: jsonDecode(data.body)["data"][i]["pdate"] ?? "",
          cus_id: jsonDecode(data.body)["data"][i]["cus_id"] ?? "",
          added_by: jsonDecode(data.body)["data"][i]["added_by"] ?? "",
          id: jsonDecode(data.body)["data"][i]["saleorder_id"] ?? "",
        ),
      );
    }
    orderList.value = List.from(orderList.reversed);
    savedOrderList.value = List.from(orderList.reversed);

    // savedOrderList.value = List.from(orderList.reversed);
    print(orderList);
    print(savedOrderList);
  }

  onGetOrderDetail({required String saleId}) async {
    var data = await ApiCall()
        .postRequest(ApisUtills().myordersdetailsUrl, {"sale_id": "$saleId"});
    print(data);
    if (data == null) {
      singleOrderList.value = [];
    } else if (data.statusCode == 200) {
      singleOrderList.value =
          OrderDetailModel.decode(jsonDecode(data.body)["data"]);
    } else if (data.statusCode == 404) {
      singleOrderList.value = [];
    }

    // for (int i = 0; i < jsonDecode(data.body)["data"].length; i++) {
    //
    //   orderList.add(
    //     OrderModel(
    //       totalprice: jsonDecode(data.body)["data"][i]["totalprice"] ?? "",
    //       pdate: jsonDecode(data.body)["data"][i]["pdate"] ?? "",
    //       cus_id: jsonDecode(data.body)["data"][i]["cus_id"] ?? "",
    //       added_by: jsonDecode(data.body)["data"][i]["added_by"] ?? "",
    //       id: jsonDecode(data.body)["data"][i]["saleorder_id"] ?? "",
    //     ),
    //   );
    //
    // }

    // savedOrderList = singleOrderList;
    // print(orderList);
    print("singleOrderList");
    print(singleOrderList);
  }
}
