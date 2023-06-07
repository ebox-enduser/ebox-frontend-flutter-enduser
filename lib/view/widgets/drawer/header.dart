import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isCollapsed;

  const CustomDrawerHeader({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 40.w,
            image: const AssetImage('assets/images/carrot.png'),
          ),
          if (isCollapsed) SizedBox(width: 10.w),
          if (isCollapsed)
            Expanded(
              flex: 3,
              child: Text(
                'eBox',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
                maxLines: 1,
              ),
            ),
          if (isCollapsed) const Spacer(),
          if (isCollapsed)
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30.r,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
