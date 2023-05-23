import 'package:ebox/controller/cart_controller.dart';
import 'package:ebox/controller/setting_controller.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import 'dashboard_controller.dart';

DashboardController dashboardController = Get.put(DashboardController());
AuthController authController = Get.put(AuthController());
SettingController settingController = Get.put(SettingController());
CartController cartController = Get.put(CartController());
