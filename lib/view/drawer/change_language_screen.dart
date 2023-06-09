import '../../../core/theme/app_colors.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/local_constant.dart';
import '../widgets/logo_text.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

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
              const LogoText(),
              Text(
                'Select Language'.tr,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
              ),
              SizedBox(
                height: 30.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
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
                            height: 15.w,
                          ),
                          Text(
                            'English - USA',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Radio(
                              value: const Locale('en', 'US'),
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
                    height: 160.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
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
                            height: 5.w,
                          ),
                          Text(
                            'ខ្មែរ',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Radio(
                              value: const Locale('km', 'KH'),
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
