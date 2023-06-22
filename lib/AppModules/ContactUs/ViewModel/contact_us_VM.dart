// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:aizacreationzz/AppModules/ContactUs/Model/ContactUsModel.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';

class contact_us_VM {
  var contactData = contact_us(
      phone: "",
      address: "address",
      contact_id: "contact_id",
      facebook: "facebook",
      gmail: "gmail",
      instagram: "instagram",
      linkedin: "linkedin",
      twiter: "twiter",
      whatsapp: "whatsapp",
      youtube: "youtube");

  Future<contact_us> onGetContact() async {
    var data = await ApiCall().postRequest(ApisUtills().contactDetailUrl, {});
    print(jsonDecode(data.body));
    print(jsonDecode(data.body)["data"][0]);
    contactData = contact_us.fromJson(jsonDecode(data.body)["data"]);
    return contactData;
  }
}
