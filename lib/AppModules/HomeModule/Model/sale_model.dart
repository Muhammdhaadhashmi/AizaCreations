// ignore_for_file: non_constant_identifier_names, camel_case_types

class sale_model {
  String slider_id;
  String slider_img;
  String slider_type;
  String slider_status;
  sale_model(
      {required this.slider_id,
      required this.slider_img,
      required this.slider_type,
      required this.slider_status});

  factory sale_model.fromJson(Map<String, dynamic> jsonData) {
    return sale_model(
      slider_id: jsonData["slider_id"],
      slider_img: jsonData["slider_img"],
      slider_type: jsonData["slider_type"],
      slider_status: jsonData["slider_status"],
    );
  }

  static List<sale_model> decode(List<dynamic> emote) =>
      emote.map<sale_model>((item) => sale_model.fromJson(item)).toList();
}
