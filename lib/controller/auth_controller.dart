import 'dart:convert';
import 'package:ebox/view/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/auth_service.dart';
import '../model/user.dart';
import '../view/dashboard_screen.dart';
import 'controllers.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();
  // ignore: prefer_typing_uninitialized_variables
  var token;

  @override
  void onInit() async {
    super.onInit();
    checkToken();
  }

  void checkToken() async {
    try {
      EasyLoading.show(
        status: 'Loading...'.tr,
        dismissOnTap: false,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      var userResult = await AuthService().getProfile(token: token);
      if (userResult.statusCode == 200) {
        user.value = userFromJson(userResult.body);
      } else {
        EasyLoading.showError('Something wrong. Try again!'.tr);
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!'.tr);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signUp(
      {required String fullName,
      required int phoneNumber,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...'.tr,
        dismissOnTap: false,
      );

      var result = await AuthService().signUp(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        var userResult = await AuthService().createProfile(
            fullName: fullName, phoneNumber: phoneNumber, token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to eBox!".tr);
          Get.offAll(() => const DashboardScreen());
        } else {
          EasyLoading.showError('Something wrong. Try again!'.tr);
        }
      } else {
        EasyLoading.showError('Something wrong. Try again!'.tr);
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!'.tr);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...'.tr,
        dismissOnTap: false,
      );

      var result = await AuthService().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await AuthService().getProfile(token: token);

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to eBox!".tr);
          Get.offAll(() => const DashboardScreen());
        } else {
          EasyLoading.showError('Something wrong. Try again!'.tr);
        }
      } else {
        EasyLoading.showError('Password wrong'.tr);
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!'.tr);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void updateUser(
      {required String password,
      required String email,
      required String phoneNumber,
      required String imageURL,
      required String fullName,
      required String gender,
      required String birthday}) async {
    try {
      EasyLoading.show(
        status: 'Loading...'.tr,
        dismissOnTap: false,
      );

      var result = await AuthService().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await AuthService().updateProfile(
            token: token,
            birthday: birthday,
            phoneNumber: phoneNumber,
            imageURL: imageURL,
            fullName: fullName,
            gender: gender);

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Update Profile Successfully!".tr);
          Get.offAll(() => const DashboardScreen());
        } else {
          EasyLoading.showError('Something wrong1. Try again!'.tr);
        }
      } else {
        EasyLoading.showError('Password is wrong'.tr);
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong2. Try again!'.tr);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void changePassword({
    required String email,
    required String? currentPassword,
    required String? password,
    required String? passwordConfirmation,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...'.tr,
        dismissOnTap: false,
      );

      var result = await AuthService().signIn(
        email: email,
        password: currentPassword,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await AuthService().changePassword(
          token: token,
          currentPassword: currentPassword,
          password: password,
          passwordConfirmation: passwordConfirmation,
        );

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Update Password Successfully!".tr);
          Get.offAll(() => const LoginScreen());
        } else {
          EasyLoading.showError('Something wrong. Try again!'.tr);
        }
      } else {
        EasyLoading.showError('Password is wrong'.tr);
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!'.tr);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('imageURL');
    cartController.vendor.value = null;
    settingController.userLocation.value = null;
    settingController.currentAddress = null;
    settingController.currentPosition = null;
    user.value = null;
    Get.offAll(() => const LoginScreen());
    update();
  }
}
