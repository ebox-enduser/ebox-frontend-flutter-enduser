import 'dart:convert';

import 'package:get/get.dart';

List<Notifications> notificationListFromJson(String val) =>
    List<Notifications>.from(
        json.decode(val)['data'].map((data) => Notifications.fromJson(data)));

class Notifications {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;

  Notifications({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> data) => Notifications(
        id: data['id'],
        title: data['attributes']['title'] ?? 'Not Yet'.tr,
        description: data['attributes']['description'] ?? 'Not Yet'.tr,
        createdAt: DateTime.parse(data['attributes']['createdAt'].toString()),
      );
}
