//
//  RootClass.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on November 7, 2021

class OrderDetailModel {
  String addedBy="";
  String addedTime="";
  String catId="";
  String customerId="";
  String deliver="";
  String des="";
  String proColor="";
  String proDiscount="";
  String proDiscription="";
  String proId="";
  String proImage="";
  String proName="";
  String proPrice="";
  String proQuantity="";
  String proSale="";
  String proSize="";
  String proStatus="";
  String proVideo="";
  String prodId="";
  String purDate="";
  String remaining="";
  String saleorderId="";
  String soId="";
  String stitching="";
  String tamount="";
  String totalqty="";
  String type="";
  String unstitching="";

  OrderDetailModel.fromJSON(Map<String, dynamic> parsedJson) {
    this.addedBy = parsedJson['added_by'];
    this.addedTime = parsedJson['added_time'];
    this.catId = parsedJson['cat_id'];
    this.customerId = parsedJson['customer_id'];
    this.deliver = parsedJson['deliver'];
    this.des = parsedJson['des'];
    this.proColor = parsedJson['pro_color'];
    this.proDiscount = parsedJson['pro_discount'];
    this.proDiscription = parsedJson['pro_discription'];
    this.proId = parsedJson['pro_id'];
    this.proImage = parsedJson['pro_image'];
    this.proName = parsedJson['pro_name'];
    this.proPrice = parsedJson['pro_price'];
    this.proQuantity = parsedJson['pro_quantity'];
    this.proSale = parsedJson['pro_sale'];
    this.proSize = parsedJson['pro_size'];
    this.proStatus = parsedJson['pro_status'];
    this.proVideo = parsedJson['pro_video'];
    this.prodId = parsedJson['prod_id'];
    this.purDate = parsedJson['pur_date'];
    this.remaining = parsedJson['remaining'];
    this.saleorderId = parsedJson['saleorder_id'];
    this.soId = parsedJson['so_id'];
    this.stitching = parsedJson['stitching'];
    this.tamount = parsedJson['tamount'];
    this.totalqty = parsedJson['totalqty'];
    this.type = parsedJson['type'];
    this.unstitching = parsedJson['unstitching'];
  }
  static List<OrderDetailModel> decode(List<dynamic> emote) =>
      emote.map<OrderDetailModel>((item) => OrderDetailModel.fromJSON(item)).toList();


}