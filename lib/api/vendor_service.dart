// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../core/constants/const.dart';

class VendorService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/vendors';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=meals.image,image,vendorImageBackground'));
    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=meals.image,image,vendorImageBackground&filters[name][\$contains]=$keyword'));
    return response;
  }
}
