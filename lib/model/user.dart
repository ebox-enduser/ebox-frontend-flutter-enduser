import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  String id;
  String fullName;
  String email;
  String gender;
  String phoneNumber;
  String imageURL;
  DateTime? birthDay;

  User(
      {required this.id,
      required this.fullName,
      required this.gender,
      required this.email,
      required this.phoneNumber,
      required this.imageURL,
      this.birthDay});

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'].toString(),
        fullName: data['fullName'] ?? 'You are not set your full name yet!',
        email: data['email'] ?? 'You are not set your email yet!',
        phoneNumber: data['phoneNumber'].toString() ??
            'You are not set your phone number yet!',
        imageURL: data['imageURL'] ??
            'https://www.tech101.in/wp-content/uploads/2018/07/blank-profile-picture.png',
        gender: data['gender'] ?? 'You are not set your gender yet!',
        birthDay:
            data['birthday'] == null ? null : DateTime.parse(data['birthday']),
      );
}
