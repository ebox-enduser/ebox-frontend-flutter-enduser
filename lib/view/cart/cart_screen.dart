import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/cart/checkout_screen.dart';
import 'package:ebox/view/cart/widgets/cart_meal_card.dart';
import 'package:ebox/view/widgets/vendor/vendor_detail.dart';
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
                    return Center(
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/ebox-42cef.appspot.com/o/no_meal_found.png?alt=media&token=7d700fb4-056a-4f0b-9ebc-020ce15a23ad&_gl=1*1cdtq9d*_ga*MTQ2ODY5MTg1NC4xNjg1NTIzOTQx*_ga_CW55HF8NVT*MTY4NjIwMDY4OC40LjEuMTY4NjIwMTEyMy4wLjAuMA..',
                            scale: 5.r,
                          ),
                          Padding(
                            padding: REdgeInsets.all(15),
                            child: Text(
                              'No meals found!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: AppColors.textColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => VendorDetail(
                                      vendor: cartController.vendor.value!,
                                    ),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r))),
                            child: Padding(
                              padding: REdgeInsets.all(15),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20.r,
                                    foregroundImage: NetworkImage(cartController
                                            .vendor.value?.imageVendor ??
                                        ''),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    cartController.vendor.value?.nameVendor ??
                                        'Not Yet'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
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
                            return const CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                padding:
                                    REdgeInsets.only(top: 15.h, bottom: 15.h),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    cartController.meals.keys.toList().length,
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
                                      size: 30.r,
                                    ),
                                    Text(
                                      '\$${cartController.vendor.value?.delivery.toString()}',
                                      style: TextStyle(
                                          fontSize: 14.sp,
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                                Obx(() {
                                  if (cartController.vendor.value == null) {
                                    return Text(
                                      '\$ ${cartController.totalPrice}',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      '\$${[
                                        cartController.vendor.value?.delivery,
                                        cartController.totalPrice
                                      ].reduce((value, element) => value + element).toString()}',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }
                                }),
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
                      fontSize: 14.sp),
                ),
              ),
            );
          } else {
            return Padding(
              padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
              child: TextButton(
                onPressed: () {
                  Get.to(() => const CheckoutScreen(),
                      transition: Transition.rightToLeftWithFade);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
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
                      fontSize: 14.sp),
                ),
              ),
            );
          }
        }));
  }
}
