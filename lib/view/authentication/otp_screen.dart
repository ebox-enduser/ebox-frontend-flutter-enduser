import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class OTPScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  OTPScreen({super.key, required this.emailController});
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4822D),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r))),
              child: Padding(
                padding: REdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back_outlined)),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Sign up'.tr,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    Row(
                      children: [
                        Text(
                          'We sent your code to: '.tr,
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                        Text(emailController.text),
                      ],
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    const Center(child: Pinput()),
                    SizedBox(
                      height: 30.w,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Get.offAll(() => MainVendor());
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r))),
                          padding: MaterialStateProperty.all(REdgeInsets.only(
                                  left: 80, right: 80, bottom: 15, top: 15)
                              .r),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffFE7655)), //Background Color

                          shadowColor: MaterialStateProperty.all(Colors.black),
                        ),
                        child: Text(
                          'NEXT'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    Row(
                      children: [
                        Text(
                          'Resend code in '.tr,
                          style: TextStyle(
                              color: const Color(0xffFE7655), fontSize: 14.sp),
                        ),
                        CountdownTimer(
                          endTime: endTime,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
