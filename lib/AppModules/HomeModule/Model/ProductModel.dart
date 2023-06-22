// ignore_for_file: non_constant_identifier_names

class ProductModel {
  String pb_id;
  String pro_Id;
  String pro_name;
  String pro_quantity;
  String pro_price;
  String pro_color;
  String pro_size;
  String pro_discount;
  String pro_discription;
  String pro_image;
  String pro_status;
  String cat_id;
  String pro_presale;
  String pro_preqty;
  String pre_saleqty;
  String prebooking_date;
  bool isliked;
  String pro_video;
  String? p_type;

  ProductModel(

  
      {required this.pro_color,
        this.pb_id="0",
      this.pro_presale = "0",
      this.pro_preqty = "0",
      this.pre_saleqty = "0",
      this.prebooking_date = "0",
      this.p_type,
      required this.pro_discount,
      required this.pro_video,
      required this.isliked,
      required this.cat_id,
      required this.pro_discription,
      required this.pro_Id,
      required this.pro_image,
      required this.pro_name,
      required this.pro_price,
      required this.pro_quantity,
      required this.pro_size,
      required this.pro_status});
  factory ProductModel.fromProJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      isliked: false,
  
      pro_color: jsonData["pro_color"],
      pro_discount: jsonData["pro_discount"] ?? "",
      pro_discription: jsonData["pro_discription"],
      pro_Id: jsonData["pro_id"],
      pro_image: jsonData["pro_image"],
      pro_name: jsonData["pro_name"],
      pro_price: jsonData["pro_price"],
      pro_quantity: jsonData["pro_quantity"],
      pro_size: jsonData["pro_size"],
      pro_status: jsonData["pro_status"],
      cat_id: jsonData["cat_id"],
      pro_video: jsonData["pro_video"],
      p_type: jsonData["p_type"]
    );
  }
  factory ProductModel.fromPreJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      isliked: false,
      pb_id: jsonData["pb_id"] ?? "", 
      pro_color: jsonData["pre_color"] ?? "",
      pro_discount: jsonData["pre_discount"] ?? "",
      pro_discription: jsonData["pre_discription"] ?? "",
      pro_Id: jsonData["pre_id"] ?? "",
      pro_image: jsonData["pre_image"] ?? "",
      pro_name: jsonData["pre_name"] ?? "",
      pro_price: jsonData["pre_price"] ?? "",
      pro_quantity: jsonData["pre_qty"] ?? "",
      pro_size: jsonData["pre_size"] ?? "",
      pro_status: jsonData["pre_status"] ?? "",
      pro_preqty: jsonData["pro_preqty"] ?? "",
      pre_saleqty: jsonData["pre_saleqty"] ?? "",
      pro_presale: jsonData["pro_presale"] ?? "",
      cat_id: jsonData["cat_id"] ?? "",
      pro_video: jsonData["pro_video"] ?? "",
          p_type: jsonData["p_type"] ?? ""
    );
  }
  //
  // static String encode(List<EmoteModel> emote) => json.encode(
  //   emote
  //       .map<Map<String, dynamic>>((emote) => EmoteModel.toMap(emote))
  //       .toList(),
  // );

  static List<ProductModel> decodePro(List<dynamic> emote) => emote
      .map<ProductModel>((item) => ProductModel.fromProJson(item))
      .toList();

  static List<ProductModel> decodePre(List<dynamic> emote) => emote
      .map<ProductModel>((item) => ProductModel.fromPreJson(item))
      .toList();
}
