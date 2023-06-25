import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/setting_controller.dart';
import '../../../core/theme/app_colors.dart';

class UpdateInformation extends StatefulWidget {
  const UpdateInformation({super.key});

  @override
  State<UpdateInformation> createState() => _UpdateInformationState();
}

class _UpdateInformationState extends State<UpdateInformation> {
  bool _passwordVisible = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _genderController = 'other'.tr;

  DateTime? _selectedDate;

  final DateTime _userBirthday = DateTime.now();

  Color backgroundColor = Colors.grey.shade500;
  Color foregroundColor = Colors.grey;

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _birthdayController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onSurface: AppColors.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: DetailScreen(
          screen: Padding(
            padding: REdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      settingController.pickImage();
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        //avatar
                        Positioned(
                          child: GetBuilder(
                              init: SettingController(),
                              builder: (state) {
                                if (settingController.profile == null) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      //avatar
                                      Positioned(
                                        child: CircleAvatar(
                                          radius: 60.r,
                                          foregroundImage: NetworkImage(
                                              authController
                                                      .user.value?.imageURL ??
                                                  'https://www.tech101.in/wp-content/uploads/2018/07/blank-profile-picture.png'),
                                        ),
                                      ),

                                      //icon and text
                                      Positioned(
                                        child: Container(
                                          width: 120.w,
                                          height: 120.w,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                                size: 30.r,
                                              ),
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              Text(
                                                'Edit'.tr,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      //avatar
                                      Positioned(
                                        child: CircleAvatar(
                                            radius: 60.r,
                                            foregroundImage: FileImage(
                                                settingController.profile!)),
                                      ),

                                      //icon and text
                                      Positioned(
                                        child: Container(
                                          width: 120.w,
                                          height: 120.w,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                                size: 30.r,
                                              ),
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              Text(
                                                'Edit'.tr,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.all(15),
                  child: const Divider(),
                ),
                Text(
                  'Full Name'.tr,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 15, top: 10),
                  child: TextFormField(
                    controller: _fullNameController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: authController.user.value?.fullName,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
                Text(
                  'Phone Number'.tr,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 15, top: 10),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: authController.user.value?.phoneNumber,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      hintStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
                Text(
                  'Birthday'.tr,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 15, top: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Center(
                          child: CircleAvatar(
                              radius: 30.r,
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                size: 25.r,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      SizedBox(
                        width: 270.w,
                        child: TextFormField(
                          controller: _birthdayController,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          readOnly: true,
                          onTap: () async {
                            _selectDate(context);
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                            hintText: _selectedDate == null
                                ? DateFormat('dd / MMMM / yyyy')
                                    .format(_userBirthday)
                                : DateFormat('dd / MMMM / yyyy')
                                    .format(_selectedDate!),
                            hintStyle: TextStyle(fontSize: 14.sp),
                            labelStyle: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Gender'.tr,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                RadioListTile(
                  title: Text(
                    "Male".tr,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  value: "male",
                  groupValue: _genderController,
                  onChanged: (value) {
                    setState(() {
                      _genderController = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text(
                    "Female".tr,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  value: "female",
                  groupValue: _genderController,
                  onChanged: (value) {
                    setState(() {
                      _genderController = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text(
                    "Not to say".tr,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  value: "other",
                  groupValue: _genderController,
                  onChanged: (value) {
                    setState(() {
                      _genderController = value.toString();
                    });
                  },
                ),
                Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: AppColors.thirdlyColor,
                      size: 20.r,
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
                  'Enter your password to confirm update your profile'.tr,
                  maxLines: 2,
                  style:
                      TextStyle(color: AppColors.thirdlyColor, fontSize: 12.sp),
                ),
                Padding(
                  padding: REdgeInsets.only(top: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: !_passwordVisible,
                    controller: _passwordController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "This field can't be empty".tr;
                      }

                      return null;
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
                    decoration: InputDecoration(
                      hintText: 'Enter your password'.tr,
                      label: Text('Password'.tr),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
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
                      ),
                      hintStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: 'Update Profile'.tr),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () async {
            if (_passwordController.text.isEmpty) {
              Get.snackbar('Something wrong!'.tr,
                  'You need to enter your password to change your profile'.tr,
                  colorText: Colors.white,
                  margin: REdgeInsets.all(15),
                  backgroundColor: Colors.redAccent,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2));
              return;
            } else {
              SharedPreferences pref = await SharedPreferences.getInstance();
              String? imageURL = pref.getString('imageURL');

              ///if user not update their info then save current data
              String fullName = _fullNameController.text.isEmpty
                  ? authController.user.value!.fullName.toString()
                  : _fullNameController.text.toString();

              String gender = _genderController.toString();
              String phoneNumber = _phoneNumberController.text.isEmpty
                  ? authController.user.value!.phoneNumber.toString()
                  : _phoneNumberController.text.toString();
              String image = imageURL == null
                  ? authController.user.value?.imageURL ??
                      'https://www.tech101.in/wp-content/uploads/2018/07/blank-profile-picture.png'
                  : imageURL.toString();
              String birthday = _birthdayController.text.isEmpty
                  ? _selectedDate.toString()
                  : authController.user.value!.birthDay.toString();

              authController.updateUser(
                password: _passwordController.text,
                phoneNumber: phoneNumber,
                imageURL: image,
                birthday: birthday,
                email: authController.user.value!.email,
                fullName: fullName,
                gender: gender,
              );
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor,
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
