
import 'package:ebox/controller/auth_controller.dart';
import 'package:ebox/core/theme/app_colors.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../widgets/logo_text.dart';

String information =
    "Lorem ipsum dolor sit amet consectetur adipiscing elit vehicula integer, senectus phasellus rhoncus erat proin etiam sodales lacinia, diam donec class euismod nibh fusce facilisi sed. Commodo quisque quis cras eget aptent id gravida iaculis enim risus eleifend, litora natoque cursus justo mattis hac curae leo pretium. Duis cursus nulla molestie suscipit aliquet neque orci eget id, nostra ultrices accumsan faucibus in ligula gravida dapibus fames proin, sociosqu purus parturient magna velit sodales at auctor.";

class AboutEbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailScreen(
        screen: Padding(
          padding: REdgeInsets.all(15),
          child: Column(
            children: [
              LogoText(),
              Text(
                "\t ${information}",
                style: TextStyle(fontSize: 12.sp, color: AppColors.textColor),
              ),
            ],
          ),
        ),
        title: 'About eBox'.tr);
  }
}
