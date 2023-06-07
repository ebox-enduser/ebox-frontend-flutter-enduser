import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/home/widgets/notification/widgets/notification_list.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailScreen(
        screen: Column(
          children: [
            Obx(() {
              if (dashboardController.notificationList.isNotEmpty) {
                return NotificationList(
                  notifications: dashboardController.notificationList,
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ],
        ),
        title: 'Notification'.tr);
  }
}
