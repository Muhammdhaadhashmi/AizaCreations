// ignore_for_file: non_constant_identifier_names

class Cart {
  String cartId;
  String created;
  String modified;
  String prodQty;
  String productId;
  String userId;
  String prod_qty;
  String pro_name;
  String pro_quantity;
  String pro_price;
  String pro_color;
  String pro_discount;
  String pro_discription;
  String pro_image;
  String cat_id;
  String orignalPrice;

  Cart(
      {required this.cartId,
      required this.created,
      required this.modified,
      required this.prodQty,
      required this.productId,
      required this.userId,
      required this.cat_id,
      required this.pro_color,
      required this.pro_discount,
      required this.pro_discription,
      required this.pro_image,
      required this.pro_name,
      required this.pro_price,
      required this.pro_quantity,
      required this.orignalPrice,
      required this.prod_qty});

  factory Cart.fromJson(Map<String, dynamic> jsonData) {
    return Cart(
      cartId: jsonData["cart_id"],
      created: jsonData["created"],
      modified: jsonData["modified"],
      prodQty: jsonData["prod_qty"],
      productId: jsonData["product_id"],
      userId: jsonData["user_id"],
      cat_id: jsonData["cat_id"],
      pro_color: jsonData["pro_color"],
      pro_discount: jsonData["pro_discount"],
      pro_discription: jsonData["pro_discription"],
      pro_image: jsonData["pro_image"],
      pro_name: jsonData["pro_name"],
      pro_price: jsonData["pro_price"],
      orignalPrice: jsonData["pro_price"],
      pro_quantity: jsonData["pro_quantity"],
      prod_qty: jsonData["prod_qty"],
    );
  }

  static List<Cart> decode(List<dynamic> emote) =>
      emote.map<Cart>((item) => Cart.fromJson(item)).toList();
}
