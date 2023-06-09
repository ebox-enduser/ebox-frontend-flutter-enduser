import 'package:ebox/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../authentication/signup_email_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: REdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.w,
                      ),
                      Text(
                        'WE ARE'.tr,
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'WHAT WE EAT'.tr,
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.w,
                      ),
                      Text(
                        'Delicious, nutritious,'.tr,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        'sustained, and budget-friendly'.tr,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 400.w,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: REdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Login'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "This field can't be empty".tr;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Enter your Email address'.tr,
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
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: !_passwordVisible,
                            controller: passwordController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "This field can't be empty".tr;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter your password'.tr,
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
                          SizedBox(
                            height: 15.w,
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                authController.signIn(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }

                              // Get.to(() => BottomNavBar());
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.r))),
                              padding: MaterialStateProperty.all(
                                  REdgeInsets.only(
                                      left: 80,
                                      right: 80,
                                      bottom: 15,
                                      top: 15)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xffFE7655)), //Background Color
                              shadowColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            child: Text(
                              'LOGIN'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ".tr,
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const SignUpEmailScreen());
                                },
                                child: Text(
                                  'Sign Up'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xffFE7655),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.w),
                          Text(
                            'By creating account or log in you agree with our'
                                .tr,
                            style:
                                TextStyle(fontSize: 11.sp, color: Colors.grey),
                          ),
                          SizedBox(height: 5.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Term & Conditions'.tr,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: const Color(0xffFE7655),
                                ),
                              ),
                              Text(
                                ' and '.tr,
                                style: TextStyle(
                                    fontSize: 11.sp, color: Colors.grey),
                              ),
                              Text(
                                'Privacy Policy'.tr,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: const Color(0xffFE7655),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
