class CategoryModel {
  String categoryId;
  String categoryName;
  String categoryImage;
  String categoryStatus;

  CategoryModel(
      {required this.categoryId,
      required this.categoryImage,
      required this.categoryName,
      required this.categoryStatus});
  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      categoryId: jsonData["category_id"],
      categoryImage: jsonData["category_image"],
      categoryName: jsonData["category_name"],
      categoryStatus: jsonData["category_status"],
    );
  }

  //
  // static String encode(List<EmoteModel> emote) => json.encode(
  //   emote
  //       .map<Map<String, dynamic>>((emote) => EmoteModel.toMap(emote))
  //       .toList(),
  // );

  static List<CategoryModel> decode(Map<String, dynamic> emote) => emote["data"]
      .map<CategoryModel>((item) => CategoryModel.fromJson(item))
      .toList();
}
