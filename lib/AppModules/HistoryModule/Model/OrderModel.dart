// ignore_for_file: non_constant_identifier_names

class OrderModel {
  String id;
  String cus_id;
  String totalprice;
  String pdate;
  String added_by;
  OrderModel(
      {required this.id,
      required this.added_by,
      required this.cus_id,
      required this.pdate,
      required this.totalprice});
  factory OrderModel.fromPreJson(Map<String, dynamic> jsonData) {
    return OrderModel(
      id: jsonData["saleorder_id"],
      added_by: jsonData["cus_id"],
      cus_id: jsonData["totalprice"],
      pdate: jsonData["pdate"],
      totalprice: jsonData["added_by"],
    );
  }
  static List<OrderModel> decode(List<dynamic> emote) =>
      emote.map<OrderModel>((item) => OrderModel.fromPreJson(item)).toList();
}
