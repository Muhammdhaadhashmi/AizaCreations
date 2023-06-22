//
//  RootClass.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on October 10, 2021

// ignore_for_file: non_constant_identifier_names

class User {
  String userAddress;
  String userAlternativeAddress;
  String userAlternativeContact;
  String userContact;
  String userEmail;
  String userId;
  String userImage;
  String userName;
  String userPassword;
  String userShippingAddress;
  String userShippingNumber;

  User({
    required this.userId,
    required this.userName,
    required this.userAddress,
    required this.userAlternativeAddress,
    required this.userAlternativeContact,
    required this.userContact,
    required this.userEmail,
    required this.userImage,
    required this.userPassword,
    required this.userShippingAddress,
    required this.userShippingNumber,
  });
  factory User.user_from_JSON(Map<String, dynamic> parsedJson) {
    return User(
      userId: parsedJson['user_id'],
      userName: parsedJson['user_name'],
      userAddress: parsedJson['user_address'],
      userAlternativeAddress: parsedJson['user_alternative_address'],
      userAlternativeContact: parsedJson['user_alternative_contact'],
      userContact: parsedJson['user_contact'],
      userEmail: parsedJson['user_email'],
      userImage: parsedJson['user_image'],
      userPassword: parsedJson['user_password'],
      userShippingAddress: parsedJson['user_shipping_address'],
      userShippingNumber: parsedJson['user_shipping_number'],
    );
  }
}
