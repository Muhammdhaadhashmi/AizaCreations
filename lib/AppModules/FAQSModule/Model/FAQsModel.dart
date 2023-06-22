class FAQsModel {

  String question;
  String answer;
  String id;

  FAQsModel(
      {required this.answer, required this.id, required this.question});
  factory  FAQsModel.fromJson(Map<String, dynamic> json)=> FAQsModel(answer: json["faq_ans"], id: json["faq_id"], question: json["faq"]);
}
class FAQsModelData {
  List<FAQsModel> pointsList;

  FAQsModelData({required this.pointsList});

  factory FAQsModelData.fromJson(List< dynamic> json) =>
      FAQsModelData(
          pointsList: List<FAQsModel>.from(
              json.map((x) => FAQsModel.fromJson(x))));
}