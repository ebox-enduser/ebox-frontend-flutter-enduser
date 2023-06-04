import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/controllers.dart';
import '../../../core/theme/app_colors.dart';

class BottomUserInfo extends StatelessWidget {
  final bool isCollapsed;

  const BottomUserInfo({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isCollapsed ? 70.h : 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: isCollapsed
          ? Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: REdgeInsets.symmetric(horizontal: 10),
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.network(
                          authController.user.value?.imageURL ??
                              'https://www.tech101.in/wp-content/uploads/2018/07/blank-profile-picture.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              authController.user.value?.fullName ?? 'No Yet',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            authController.user.value?.phoneNumber ??
                                'Not Yet'.tr,
                            style: TextStyle(
                                color: Colors.white70, fontSize: 11.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: REdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            title: 'WARNING'.tr,
                            desc: 'Would you sure like to sign out?'.tr,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              authController.signOut();
                            },
                          ).show();
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Container(
                    margin: REdgeInsets.only(top: 10),
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        authController.user.value?.imageURL ??
                            'https://www.tech101.in/wp-content/uploads/2018/07/blank-profile-picture.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.bottomSlide,
                        title: 'WARNING'.tr,
                        desc: 'Would you sure like to sign out?'.tr,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          authController.signOut();
                        },
                      ).show();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 20.r,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
