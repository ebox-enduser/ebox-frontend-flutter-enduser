import 'package:ebox/core/theme/app_colors.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:ebox/view/settings/about_ebox_screen.dart';
import 'package:ebox/view/settings/change_language_screen.dart';
import 'package:ebox/view/settings/profile/profile_screen.dart';
import 'package:ebox/view/home/widgets/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../settings/delivery_location/delivery_location_screen.dart';
import 'bottom_user_info.dart';
import 'custom_list_tile.dart';
import 'header.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 270.w : 70.w,
        margin: REdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          color: AppColors.backgroundColor,
        ),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(isCollapsed: _isCollapsed),
              const Divider(
                color: Colors.grey,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person,
                title: 'Profile'.tr,
                infoCount: 0,
                widget: ProfileScreen(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.pin_drop,
                title: 'Delivery Location'.tr,
                infoCount: 0,
                widget: DeliveryLocationScreen(),
              ),
              const Divider(color: Colors.grey),
              const Spacer(),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.language,
                title: 'Change Language'.tr,
                infoCount: 0,
                widget: ChangeLanguageScreen(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.info,
                title: 'About eBox'.tr,
                infoCount: 0,
                widget: AboutEbox(),
              ),
              SizedBox(height: 10.h),
              BottomUserInfo(isCollapsed: _isCollapsed),
              const Divider(color: Colors.grey),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                  child: Padding(
                    padding: REdgeInsets.all(15.0),
                    child: Icon(
                      _isCollapsed
                          ? Icons.arrow_back_ios
                          : Icons.arrow_forward_ios,
                      color: AppColors.black,
                      size: 20.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
