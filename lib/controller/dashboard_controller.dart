import 'package:ebox/model/plan.dart';
import 'package:get/get.dart';

import '../api/banner_service.dart';
import '../api/notification_service.dart';
import '../api/plan_service.dart';
import '../api/vendor_service.dart';
import '../model/ad_banner.dart';

import '../model/notifications.dart';
import '../model/vendor.dart';

class DashboardController extends GetxController {
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Vendor> vendorList = List<Vendor>.empty(growable: true).obs;
  RxList<Plan> planList = List<Plan>.empty(growable: true).obs;
  RxList<Notifications> notificationList =
      List<Notifications>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;
  RxBool isVendorLoading = false.obs;
  RxBool isPlanLoading = false.obs;
  RxBool isNotificationLoading = false.obs;

  @override
  void onInit() async {
    getAdBanners();
    getVendors();
    getPlans();
    getNotification();
    super.onInit();
  }

  void getNotification() async {
    try {
      isNotificationLoading(true);
      //call api
      var result = await NotificationService().get();
      if (result != null) {
        //assign api result
        notificationList.assignAll(notificationListFromJson(result.body));
      }
    } finally {
      isNotificationLoading(false);
    }
  }

  void postNotification({
    required String? title,
    required String? description,
  }) async {
    await NotificationService().post(
      title: title,
      description: description,
    );
  }

  void getPlans() async {
    try {
      isPlanLoading(true);

      //call api
      var result = await PlanService().get();
      if (result != null) {
        //assign api result
        planList.assignAll(planListFromJson(result.body));
      }
    } finally {
      isPlanLoading(false);
    }
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);

      //call api
      var result = await BannerService().get();
      if (result != null) {
        //assign api result
        bannerList.assignAll(adBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getVendors() async {
    try {
      isVendorLoading(true);
      //call api
      var result = await VendorService().get();
      if (result != null) {
        //assign api result
        vendorList.assignAll(vendorListFromJson(result.body));
      }
    } finally {
      isVendorLoading(false);
    }
  }
}
