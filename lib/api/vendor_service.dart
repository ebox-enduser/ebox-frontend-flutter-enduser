import 'package:http/http.dart' as http;

import '../../core/constants/const.dart';

class VendorService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/vendors';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=meals.image, locations,image,vendorImageBackground'));
    return response;
  }

  Future<dynamic> getById({required int id}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=meals.image, locations,image,vendorImageBackground&filters[id][\$eq]=$id'));
    return response;
  }
}
