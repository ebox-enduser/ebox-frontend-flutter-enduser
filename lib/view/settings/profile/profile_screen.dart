import 'package:ebox/controller/auth_controller.dart';
import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/settings/profile/widgets/information_card.dart';
import 'package:ebox/view/settings/profile/update_profile_screen.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

import '../../../controller/setting_controller.dart';
import '../../../core/theme/app_colors.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: DetailScreen(
        screen: Column(children: [
          CircleAvatar(
            radius: 60.r,
            foregroundImage: NetworkImage(authController.user.value?.imageURL ??
                'https://www.tech101.in/wp-content/uploads/2018/07/blank-profile-picture.png'),
          ),
          Padding(
            padding: REdgeInsets.all(15),
            child: Divider(),
          ),
          InformationCard(
            title: 'Full Name'.tr,
            Data: authController.user.value?.fullName ?? 'Not Yet',
          ),
          InformationCard(
            title: 'Phone Number'.tr,
            Data: authController.user.value?.phoneNumber ?? 'Not Yet',
          ),
          InformationCard(
            title: 'Email'.tr,
            Data: authController.user.value?.email ?? 'Not Yet',
          ),
          InformationCard(
            title: 'Birthday'.tr,
            Data:
                ' ${authController.user.value?.birthDay?.day.toString()} / ${DateFormat('MMMM').format(DateTime(0, authController.user.value?.birthDay?.month ?? 0))} / ${authController.user.value?.birthDay?.year.toString()}  ',
          ),
          InformationCard(
            title: 'Gender'.tr,
            Data: authController.user.value?.gender ?? 'Not Yet',
          ),
          Padding(
            padding: REdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                Get.to(() => ChangePasswordScreen());
              },
              child: Text('Change Password'.tr),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 5,
                backgroundColor: Colors.red,
                padding:
                    REdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r)),
              ),
            ),
          )
        ]),
        title: 'Profile'.tr,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            Get.to(() => UpdateInformation());
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            elevation: 5,
            backgroundColor: AppColors.primaryColor,
            padding: REdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r)),
          ),
          child: Text(
            'Update Profile'.tr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
