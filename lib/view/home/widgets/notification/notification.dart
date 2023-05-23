import 'package:ebox/controller/auth_controller.dart';
import 'package:ebox/view/home/widgets/notification/notification_card.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../core/theme/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailScreen(
        screen: Column(
          children: [NotificationCard()],
        ),
        title: 'Notification'.tr);
  }
}
