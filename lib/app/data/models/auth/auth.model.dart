class AuthModel {
  AuthModel({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;
  User user;
}

class User {
  User({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.document,
    required this.phone,
    required this.email,
    required this.profileVisible,
    required this.notification,
    required this.location,
    required this.occupationId,
    required this.documentTypeId,
    required this.nationalityId,
    required this.civilStateId,
    required this.genderId,
  });

  int id;
  String name;
  DateTime birthDate;
  String document;
  String phone;
  String email;
  int profileVisible;
  int notification;
  String location;
  int occupationId;
  int documentTypeId;
  int nationalityId;
  int civilStateId;
  int genderId;
}
