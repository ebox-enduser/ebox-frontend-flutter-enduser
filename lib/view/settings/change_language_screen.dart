import 'package:ebox/controller/auth_controller.dart';
import '../../../core/theme/app_colors.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../core/constants/local_constant.dart';
import '../widgets/logo_text.dart';

class ChangeLanguageScreen extends StatefulWidget {
  ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  Locale? _selectedLanguage = Get.locale;
  void _handleRadioValueChange(Locale? value) {
    setState(() {
      _selectedLanguage = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DetailScreen(
        screen: Padding(
          padding: REdgeInsets.all(15),
          child: Column(
            children: [
              LogoText(),
              Text(
                'Select Language'.tr,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3.r), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg',
                            fit: BoxFit.cover,
                            width: 80.w,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'English - USA',
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Radio(
                              value: Locale('en', 'US'),
                              activeColor: AppColors.primaryColor,
                              groupValue: _selectedLanguage,
                              onChanged: (value) {
                                _handleRadioValueChange(value);
                                setLocale(
                                    value!.languageCode, value.countryCode!);
                                Get.updateLocale(value);
                              }),
                        ]),
                  ),
                  Container(
                    width: 160.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3.r), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://cdn.britannica.com/27/4027-004-B57F84E9/Flag-Cambodia.jpg',
                            fit: BoxFit.cover,
                            width: 80.w,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'ខ្មែរ',
                          ),
                          Radio(
                              value: Locale('km', 'KH'),
                              activeColor: AppColors.primaryColor,
                              groupValue: _selectedLanguage,
                              onChanged: (value) {
                                _handleRadioValueChange(value);
                                setLocale(
                                    value!.languageCode, value.countryCode!);
                                Get.updateLocale(value);
                              }),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
        title: 'Change Language'.tr);
  }
}
