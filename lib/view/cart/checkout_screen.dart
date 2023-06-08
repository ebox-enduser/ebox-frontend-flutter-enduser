import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/dashboard_screen.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final List<String> deliveryTimes = [
    'ASAP'.tr,
    '07:00 AM - 08:00 AM',
    '11:30 AM - 12:00 PM',
    '5:30 PM - 6:00 PM',
  ];

  String? _selectedPayment = 'Cash';
  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedPayment = value;
    });
  }

  String? selectedValueDelivery = 'ASAP'.tr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: DetailScreen(
          screen: Padding(
            padding: REdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      color: AppColors.primaryColor,
                      size: 20.r,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Your location:',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                Padding(
                  padding: REdgeInsets.only(left: 15, top: 5, bottom: 15),
                  child: Text(
                    settingController.userLocation.value?.address ??
                        'You are not set your location yet',
                    style:
                        TextStyle(color: AppColors.textColor, fontSize: 12.sp),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: AppColors.primaryColor,
                      size: 20.r,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Delivery time:',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                //info
                Padding(
                  padding: REdgeInsets.only(left: 15, top: 10, bottom: 15),
                  child: CustomDropdownButton2(
                    buttonWidth: MediaQuery.of(context).size.width * 0.9,
                    hint: 'Delivery Times'.tr,
                    dropdownItems: deliveryTimes,
                    value: selectedValueDelivery,
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      color: Colors.white,
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
                ),
                Row(
                  children: [
                    Icon(
                      Icons.payments,
                      color: AppColors.primaryColor,
                      size: 20.r,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Choose your payment method',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                Padding(
                  padding: REdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 140.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delivery_dining,
                                size: 60.r,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                'Cash on delivery'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Radio(
                                  value: 'Cash',
                                  activeColor: AppColors.primaryColor,
                                  groupValue: _selectedPayment,
                                  onChanged: (value) {
                                    _handleRadioValueChange(value);
                                  }),
                            ]),
                      ),
                      Container(
                        width: 140.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Image.network(
                                'https://i.pinimg.com/originals/e2/33/f5/e233f5b0c5a358449398f202b03f063a.jpg',
                                fit: BoxFit.cover,
                                width: 60.w,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'ABA Bank'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Radio(
                                  value: 'ABA',
                                  activeColor: AppColors.primaryColor,
                                  groupValue: _selectedPayment,
                                  onChanged: (value) {
                                    _handleRadioValueChange(value);
                                  }),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          title: 'Checkout'.tr),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
        child: TextButton(
          onPressed: () async {
            // /// name of meals
            // print(cartController.meals.entries
            //     .map((meal) => meal.key.nameMeal)
            //     .toList());

            // /// quantity meals
            // print(cartController.meals.values.toList());

            // print(settingController.userLocation.value?.address);
            // print(cartController.mealsWithQuantity);
            // print(_selectedPayment);
            // print([
            //   cartController.vendor.value?.delivery,
            //   cartController.totalPrice
            // ].reduce((value, element) => value + element).toString());
            // print(cartController.idMeals);
            // print(cartController.idVendor);

            // print(settingController.userLocation.value?.address.runtimeType);
            // print(cartController.mealsWithQuantity.runtimeType);
            // print(_selectedPayment.runtimeType);
            // print([
            //   cartController.vendor.value?.delivery,
            //   cartController.totalPrice
            // ]
            //     .reduce((value, element) => value + element)
            //     .toString()
            //     .runtimeType);
            // print(cartController.idMeals.runtimeType);
            // print(cartController.idVendor.runtimeType);

            dashboardController.createMealOrder(
              address:
                  settingController.userLocation.value?.address ?? 'Not Yet',
              name: cartController.mealsWithQuantity,
              paymentMethod: _selectedPayment ?? 'Not Yet',
              totalPrice: [
                cartController.vendor.value?.delivery,
                cartController.totalPrice
              ].reduce((value, element) => value + element).toString(),
              meals: cartController.idMeals,
              vendor: cartController.idVendor,
            );
            cartController.vendor.value = null;
            cartController.meals.clear();
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.bottomSlide,
              title: 'Order Success!',
              dismissOnTouchOutside: false,
              btnOkOnPress: () {
                Get.offAll(() => const DashboardScreen());
              },
            ).show();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
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
