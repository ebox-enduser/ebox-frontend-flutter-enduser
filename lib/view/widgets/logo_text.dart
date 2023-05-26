import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/carrot.png',
          width: 80.w,
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'eBox',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
        ),
        SizedBox(
          height: 60.h,
        ),
      ],
    );
  }
}
