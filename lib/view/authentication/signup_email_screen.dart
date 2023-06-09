import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({super.key});

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: const Color(0xffF4822D),
      body: DetailScreen(
          screen: Padding(
            padding: REdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create your own email and password'.tr,
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 30.w,
                ),
                TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    label: Text('Full Name'.tr),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    hintStyle: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 15.w,
                ),
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    label: Text('Phone Number'.tr),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    hintStyle: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 15.w,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text('Email address'.tr),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    hintStyle: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 15.w,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      label: Text('Password'.tr),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 16.sp),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      )),
                ),
              ],
            ),
          ),
          title: 'Sign Up'.tr),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            authController.signUp(
                email: emailController.text,
                fullName: fullNameController.text,
                password: passwordController.text,
                phoneNumber: int.parse(phoneNumberController.text));
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primaryColor,
            padding: REdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r)),
          ),
          child: Text(
            'Sign Up'.tr,
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
