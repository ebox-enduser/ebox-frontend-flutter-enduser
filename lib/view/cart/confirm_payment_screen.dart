import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:get/get.dart';
import 'package:ebox/view/cart/widgets/cart_meal_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  final List<String> deliveryTimes = [
    'ASAP'.tr,
    '07:00 AM - 08:00 AM',
    '11:30 AM - 12:00 PM',
    '5:30 PM - 6:00 PM',
  ];

  final List<String> location = [
    'Current Location'.tr,
  ];
  final List<String> shipments = [
    'Pick Up'.tr,
    'Delivery'.tr,
  ];
  final List<String> payments = [
    'Cash on delivery'.tr,
    'ABA BANK'.tr,
  ];
  String? selectedValueDelivery = 'ASAP'.tr;
  String? selectedValueLocation = 'Current Location'.tr;
  String? selectedValueShipment = 'Delivery'.tr;
  String? selectedValuePayment = 'Cash on delivery'.tr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: DetailScreen(
          screen: Column(
            children: [
              //info
              CustomDropdownButton2(
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                hint: 'Delivery Times'.tr,
                dropdownItems: deliveryTimes,
                value: selectedValueDelivery,
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: AppColors.lightBlue,
                ),
                dropdownWidth: MediaQuery.of(context).size.width * 0.9,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: AppColors.backgroundColor,
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 40.r,
                  color: AppColors.primaryColor,
                ),
                onChanged: (index) {
                  setState(() {
                    selectedValueDelivery = index;
                  });
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomDropdownButton2(
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                dropdownItems: location,
                value: selectedValueLocation,
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: AppColors.lightBlue,
                ),
                dropdownWidth: MediaQuery.of(context).size.width * 0.9,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: AppColors.backgroundColor,
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 40.r,
                  color: AppColors.primaryColor,
                ),
                onChanged: (index) {
                  setState(() {
                    selectedValueLocation = index;
                  });
                },
                hint: 'location'.tr,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomDropdownButton2(
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                dropdownItems: shipments,
                value: selectedValueShipment,
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: AppColors.lightBlue,
                ),
                dropdownWidth: MediaQuery.of(context).size.width * 0.9,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: AppColors.backgroundColor,
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 40.r,
                  color: AppColors.primaryColor,
                ),
                onChanged: (index) {
                  setState(() {
                    selectedValueShipment = index;
                  });
                },
                hint: 'shipment'.tr,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomDropdownButton2(
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                dropdownItems: payments,
                value: selectedValuePayment,
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: AppColors.lightBlue,
                ),
                dropdownWidth: MediaQuery.of(context).size.width * 0.9,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: AppColors.backgroundColor,
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 40.r,
                  color: AppColors.primaryColor,
                ),
                onChanged: (index) {
                  setState(() {
                    selectedValuePayment = index;
                  });
                },
                hint: 'payment'.tr,
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
          title: 'Checkout'.tr),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () {
            Get.to(() => ConfirmPaymentScreen());
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            elevation: 5,
            backgroundColor: AppColors.primaryColor,
            padding: REdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r)),
          ),
          child: Text(
            'Pay'.tr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
