import 'package:ebox/controller/controllers.dart';
import 'package:ebox/model/meal_ordered.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../widgets/vendor/vendor_detail.dart';

class OrderedDetailScreen extends StatelessWidget {
  final MealOrdered mealOrdered;
  final int index;
  const OrderedDetailScreen(
      {super.key, required this.mealOrdered, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: DetailScreen(
            screen: Padding(
              padding: REdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => VendorDetail(
                            vendor: Vendor(
                                idVendor: mealOrdered.idVendor,
                                imageVendor: mealOrdered.imageVendor,
                                imageVendorBackground:
                                    mealOrdered.imageVendorBackground,
                                nameMeal: mealOrdered.nameMealVendor,
                                imageMeal: mealOrdered.imageMealVendor,
                                foodType: mealOrdered.foodTypeVendor,
                                price: mealOrdered.priceVendor,
                                fat: mealOrdered.fatVendor,
                                location: mealOrdered.location,
                                nameVendor: mealOrdered.nameVendor,
                                phoneNumber: mealOrdered.phoneNumber,
                                businessTime: mealOrdered.businessTime,
                                duration: mealOrdered.duration,
                                delivery: mealOrdered.delivery,
                                distance: mealOrdered.distance,
                                youtubeURL: mealOrdered.youtubeURLVendor,
                                ingredients: mealOrdered.ingredientsVendor,
                                ordered: mealOrdered.ordered,
                                idMeal: mealOrdered.idMealVendor),
                          ));
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
                              foregroundImage:
                                  NetworkImage(mealOrdered.imageVendor),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              mealOrdered.nameVendor,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w500),
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
                  Padding(
                    padding: REdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Padding(
                        padding: REdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/meal.png',
                                  scale: 30.r,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Meals'.tr,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const Divider(),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: mealOrdered.nameMeal.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: REdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60.w,
                                          height: 60.h,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.r)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      mealOrdered
                                                          .imageMeal[index]),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mealOrdered.nameMeal[index],
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 200.w,
                                              child: Text(
                                                mealOrdered.ingredients[index],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.textColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          '\$${mealOrdered.price[index]}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            Row(
                              children: [
                                Text(
                                  'Delivery fee'.tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '\$${mealOrdered.delivery}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: REdgeInsets.only(top: 10, bottom: 10),
                              child: const Divider(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Total'.tr,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      ' \$${mealOrdered.totalPrice}',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Exchange rate'.tr,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                    Text(
                                      ' 1\$ = 4100 riel',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Padding(
                        padding: REdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.delivery_dining,
                                  size: 20.r,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Delivery information'.tr,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery address'.tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 180.w,
                                  child: Text(
                                    settingController
                                            .userLocation.value?.address ??
                                        'Not Yet'.tr,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery time'.tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    mealOrdered.createdAt.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Padding(
                        padding: REdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.receipt,
                                  size: 20.r,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Transaction'.tr,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Number'.tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    mealOrdered.id.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Method'.tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    mealOrdered.paymentMethod.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Time'.tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    mealOrdered.createdAt.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            title: 'Ordered Detail'.tr),
        bottomNavigationBar: Padding(
          padding: REdgeInsets.only(left: 45, right: 45, bottom: 15),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.primaryColor,
              padding:
                  REdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r)),
            ),
            child: Text(
              'Order Again'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14.sp),
            ),
          ),
        ));
  }
}
