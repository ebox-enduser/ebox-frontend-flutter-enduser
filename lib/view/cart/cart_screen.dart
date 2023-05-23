import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/cart/confirm_payment_screen.dart';
import 'package:ebox/view/cart/widgets/cart_meal_card.dart';
import 'package:ebox/view/home/widgets/vendor/vendor_detail.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: DetailScreen(
            screen: Padding(
              padding: REdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Column(children: [
                Obx(() {
                  if (cartController.meals.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Image.asset(
                          'assets/images/no_order.png',
                          width: 300.w,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'No meal found yet!'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: AppColors.textColor),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => VendorDetail(
                                  vendor: cartController.vendor.value!,
                                ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryBackgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r))),
                            child: Padding(
                              padding: REdgeInsets.all(15),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: NetworkImage(cartController
                                            .vendor.value?.vendorImage ??
                                        ''),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    cartController.vendor.value?.name ??
                                        'Not Yet'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18.r,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Obx(() {
                          if (cartController.meals.isEmpty) {
                            return CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                padding: REdgeInsets.only(top: 15),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: cartController.meals.length,
                                itemBuilder: (context, index) => CartMealCard(
                                      index: index,
                                      cartMeal: cartController.meals.keys
                                          .toList()[index],
                                      quantity: cartController.meals.values
                                          .toList()[index],
                                      vendor: cartController.vendor.value!,
                                    ));
                          }
                        }),
                        Row(
                          children: [
                            Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  )),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delivery_dining,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '\$${cartController.vendor.value?.delivery.toString()}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total'.tr,
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                                Text(
                                  '\$${[
                                    cartController.vendor.value?.delivery,
                                    cartController.total
                                  ].reduce((value, element) => value + element).toString()}',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                }),
              ]),
            ),
            title: 'Shopping Cart'.tr),
        bottomNavigationBar: Obx(() {
          if (cartController.meals.isEmpty) {
            return Padding(
              padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 5,
                  backgroundColor: Colors.grey,
                  padding: REdgeInsets.only(
                      top: 20, bottom: 20, left: 40, right: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r)),
                ),
                child: Text(
                  'Proceed to checkout'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.sp),
                ),
              ),
            );
          } else {
            return Padding(
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
                      top: 20, bottom: 20, left: 40, right: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r)),
                ),
                child: Text(
                  'Proceed to checkout'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.sp),
                ),
              ),
            );
          }
        }));
  }
}
