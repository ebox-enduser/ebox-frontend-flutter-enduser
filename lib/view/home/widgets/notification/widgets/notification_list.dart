import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../model/notifications.dart';
import 'notification_card.dart';

class NotificationList extends StatelessWidget {
  final List<Notifications> notifications;
  const NotificationList({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: REdgeInsets.only(left: 15, right: 15),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationCard(
          notifications: notifications.reversed.toList()[index],
        );
      },
    );
  }
}
