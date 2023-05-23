import 'package:http/http.dart' as http;

import '../../core/constants/const.dart';

class PlanService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/plans';

  Future<dynamic> get() async {
    var response = await client
        .get(Uri.parse('$remoteUrl?fields=name&populate=image,meals.image'));
    return response;
  }
}
