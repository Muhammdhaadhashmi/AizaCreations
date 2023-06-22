// ignore_for_file: non_constant_identifier_names

import 'package:aizacreationzz/AppModules/FAQSModule/Model/FAQsModel.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:get/get.dart';

class FaqsViewModel extends GetxController {
  var FaqsData = [
    // FAQsModel(
    //   faqimg: "assets/drawericon/faqicon.png",
    //   question:
    //   "what is the size and weight limit on my package weight limit on my package?",
    //   answer:
    //   "An effective FAQ resource can educate, inform, and guide the user in a natural way through your website’s content and toward the goals and end results you have set.",
    // ),
    // FAQsModel(
    //   faqimg: "assets/drawericon/faqicon.png",
    //   question:
    //   "what is the size and weight limit on my package weight limit on my package?",
    //   answer:
    //   "An effective FAQ resource can educate, inform, and guide the user in a natural way through your website’s content and toward the goals and end results you have set.",
    // ),
  ].obs;
  getFAQS() async {
    var data = await ApiCall().getRequest(ApisUtills().faqsUrl);
    var list = FAQsModelData.fromJson(data["data"]).pointsList;
    FaqsData.value = list;
    print(list);
  }
}
