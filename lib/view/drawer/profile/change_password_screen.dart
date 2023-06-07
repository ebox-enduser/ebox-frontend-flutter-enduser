import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  Color backgroundColor = Colors.grey.shade500;
  Color foregroundColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: DetailScreen(
          screen: Padding(
            padding: REdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: AppColors.thirdlyColor,
                    size: 16.sp,
                  ),
                  Text(
                    'WARNING'.tr,
                    maxLines: 2,
                    style: TextStyle(
                        color: AppColors.thirdlyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ],
              ),
              Text(
                'After change your password it will move to login screen.'.tr,
                maxLines: 2,
                style:
                    TextStyle(color: AppColors.thirdlyColor, fontSize: 14.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextFormField(
                controller: _currentPasswordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: !_currentPasswordVisible,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty".tr;
                  }
                  return null;
                },
                //This will obscure text dynamically
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),

                  hintText: 'Enter your current password'.tr,
                  hintStyle: TextStyle(fontSize: 14.sp),
                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _currentPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentPasswordVisible = !_currentPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextFormField(
                controller: _newPasswordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: !_newPasswordVisible,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty".tr;
                  }
                  return null;
                },
                //This will obscure text dynamically
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),

                  hintText: 'Enter your new password'.tr,
                  hintStyle: TextStyle(fontSize: 14.sp),

                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _newPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _newPasswordVisible = !_newPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: !_confirmPasswordVisible,
                validator: (String? value) {
                  // ignore: unrelated_type_equality_checks
                  if (value == _newPasswordController) {
                    return "";
                  }

                  return "Passwords do not match".tr;
                },
                onChanged: (val) {
                  setState(() {
                    backgroundColor = val.isNotEmpty
                        ? AppColors.primaryColor
                        : Colors.grey.shade500;
                    foregroundColor =
                        val.isNotEmpty ? Colors.white : Colors.grey;
                  });
                },
                //This will obscure text dynamically
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),

                  hintText: 'Enter retype your password'.tr,
                  hintStyle: TextStyle(fontSize: 14.sp),

                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _confirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ]),
          ),
          title: 'Change Password'.tr),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            authController.changePassword(
                email: authController.user.value!.email,
                currentPassword: _currentPasswordController.text,
                password: _newPasswordController.text,
                passwordConfirmation: _confirmPasswordController.text);
          },
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor,
            elevation: 5,
            backgroundColor: backgroundColor,
            padding: REdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r)),
          ),
          child: Text(
            'Save'.tr,
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
