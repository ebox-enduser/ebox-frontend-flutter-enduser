// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../core/constants/const.dart';

class BannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/banners';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl?populate=image'));
    return response;
  }
}
