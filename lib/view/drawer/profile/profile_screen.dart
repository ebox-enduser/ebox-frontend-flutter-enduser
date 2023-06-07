import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/widgets/information_card.dart';
import 'package:ebox/view/drawer/profile/update_profile_screen.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            child: const Divider(),
          ),
          Obx(
            () => InformationCard(
              title: 'Full Name'.tr,
              Data: authController.user.value?.fullName ?? 'Not Yet',
            ),
          ),
          Obx(
            () {
              if (authController.user.value?.phoneNumber == null) {
                return InformationCard(
                  title: 'Phone Number'.tr,
                  Data: 'You are not set your phone number yet!',
                );
              } else {
                return InformationCard(
                  title: 'Phone Number'.tr,
                  Data: authController.user.value!.phoneNumber,
                );
              }
            },
          ),
          Obx(
            () => InformationCard(
              title: 'Email'.tr,
              Data: authController.user.value?.email ?? 'Not Yet',
            ),
          ),
          Obx(
            () => InformationCard(
              title: 'Birthday'.tr,
              Data: authController.user.value?.birthDay ?? 'Not Yet',
            ),
          ),
          Obx(
            () => InformationCard(
              title: 'Gender'.tr,
              Data: authController.user.value?.gender ?? 'Not Yet',
            ),
          ),
          Padding(
            padding: REdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                Get.to(() => const ChangePasswordScreen());
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                padding:
                    REdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r)),
              ),
              child: Text(
                'Change Password'.tr,
                style: TextStyle(fontSize: 14.sp),
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
            Get.to(() => const UpdateInformation());
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
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
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
