import 'dart:convert';

UserLocation userLocationFromJson(String str) =>
    UserLocation.fromJson(json.decode(str));

class UserLocation {
  String id;
  String name;
  String description;
  String position;
  String address;

  UserLocation({
    required this.id,
    required this.name,
    required this.description,
    required this.position,
    required this.address,
  });

  factory UserLocation.fromJson(Map<String, dynamic> data) => UserLocation(
        id: data['id'].toString(),
        name: data['name'] ?? 'Not Yet',
        description: data['description'] ?? 'Not Yet',
        position: data['position'] ?? 'Not Yet',
        address: data['address'] ?? 'Not Yet',
      );
}
