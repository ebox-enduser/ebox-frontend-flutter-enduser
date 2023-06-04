import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/cart/cart_screen.dart';
import 'package:ebox/view/order/ordered/ordered_screen.dart';

import 'package:ebox/view/plan/plan_screen.dart';
import 'package:ebox/view/drawer/profile/profile_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import 'package:ebox/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_scroll/text_scroll.dart';
import 'widgets/drawer/custom_drawer.dart';
import 'package:badges/badges.dart' as badges;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1;
  List listScreen = [
    const PlanScreen(),
    const HomeScreen(),
    OrderedScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!

    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: AppBar(
        title: Obx(
          () => SizedBox(
            height: 15.h,
            child: TextScroll(
              '              Address: ${settingController.userLocation.value?.address ?? 'Please set your location address first'.tr}',
              velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
              mode: TextScrollMode.endless,
              style: TextStyle(color: AppColors.textColor, fontSize: 10.sp),
              textAlign: TextAlign.left,
              selectable: true,
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                'assets/images/drawer.png',
                scale: 15.r,
                color: AppColors.primaryColor,
              ),
            );
          },
        ),
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        actions: [
          Padding(
            padding: REdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Get.to(() => ProfileScreen());
              },
              child: Obx(
                () => CircleAvatar(
                    radius: 20.r,
                    backgroundImage: NetworkImage(authController
                            .user.value?.imageURL ??
                        'https://firebasestorage.googleapis.com/v0/b/ebox-42cef.appspot.com/o/blank-profile-picture-973460_960_720.webp?alt=media&token=a5a714ac-2722-4380-a939-f347fb7acb87&_gl=1*1g2b3vl*_ga*MTQ2ODY5MTg1NC4xNjg1NTIzOTQx*_ga_CW55HF8NVT*MTY4NTUyMzk0MC4xLjEuMTY4NTUyNDEzNS4wLjAuMA..')),
              ),
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: listScreen.elementAt(_selectedIndex),
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 60.h,
        backgroundColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.black.withOpacity(0.4),
        snakeViewColor: AppColors.secondaryColor,
        selectedItemColor: Colors.white,
        snakeShape: SnakeShape.circle,
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/plan.png',
                scale: 20.r,
                color: Colors.white,
              ),
              icon: Image.asset(
                'assets/images/plan.png',
                scale: 25.r,
                color: AppColors.black.withOpacity(0.4),
              ),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/home.png',
                scale: 20.r,
                color: Colors.white,
              ),
              icon: Image.asset(
                'assets/images/home.png',
                scale: 25.r,
                color: AppColors.black.withOpacity(0.4),
              ),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/receipt.png',
                scale: 15.r,
                color: Colors.white,
              ),
              icon: Image.asset(
                'assets/images/receipt.png',
                scale: 20.r,
                color: AppColors.black.withOpacity(0.4),
              ),
              label: ''),
        ],
      ),
      floatingActionButton: Obx(() {
        if (cartController.meals.isEmpty) {
          return FloatingActionButton(
            onPressed: () {
              Get.to(() => CartScreen());
            },
            foregroundColor: Colors.white,
            backgroundColor: AppColors.secondaryColor,
            child: Image.asset('assets/images/cart.png',
                scale: 20.r, color: Colors.white),
          );
        } else {
          return badges.Badge(
            position: badges.BadgePosition.topEnd(top: -5, end: -5),
            badgeContent: Text(
              cartController.totalQuantity.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: FloatingActionButton(
              onPressed: () {
                Get.to(() => CartScreen());
              },
              foregroundColor: Colors.white,
              backgroundColor: AppColors.secondaryColor,
              child: Image.asset('assets/images/cart.png',
                  scale: 20.r, color: Colors.white),
            ),
          );
        }
      }),
    );
  }
}
