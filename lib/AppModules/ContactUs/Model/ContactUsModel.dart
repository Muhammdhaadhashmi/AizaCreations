// ignore_for_file: non_constant_identifier_names, camel_case_types

class contact_us {
  String contact_id;
  String whatsapp;
  String facebook;
  String instagram;
  String gmail;
  String youtube;
  String linkedin;
  String twiter;
  String address;
  String phone;

  contact_us(
      {required this.phone,
      required this.address,
      required this.contact_id,
      required this.facebook,
      required this.gmail,
      required this.instagram,
      required this.linkedin,
      required this.twiter,
      required this.whatsapp,
      required this.youtube});

  factory contact_us.fromJson(List<dynamic> jsonData) {
    return contact_us(
      address: jsonData[0]["address"],
      contact_id: jsonData[0]["contact_id"],
      facebook: jsonData[0]["facebook"],
      gmail: jsonData[0]["gmail"],
      instagram: jsonData[0]["instagram"],
      linkedin: jsonData[0]["linkedin"],
      phone: jsonData[0]["phone"],
      twiter: jsonData[0]["twiter"],
      whatsapp: jsonData[0]["whatsapp"],
      youtube: jsonData[0]["youtube"],
    );
  }
// "contact_id": "1",
// "whatsapp": "03001234567",
// "facebook": "https://www.facebook.com/devicon.official",
// "instagram": "https://www.instagram.com/",
// "gmail": "awaisit13@gmail.com",
// "youtube": "https://www.youtube.com/",
// "linkedin": "https://www.linkedin.com/",
// "twiter": "https://www.twitter.com/",
// "address": "Rahim Yar Khan",
// "phone": "03030336939"
}
