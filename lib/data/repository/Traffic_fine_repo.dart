import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class TrafficFineRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  TrafficFineRepo(this.prefs, this._api);


  Future<ApiResponse2> cashVariance() async {
    var response = await _api.postRequest("get_traffic_fine_list", {
      "token":'f9a3e60964a3ffef05050dbeb0e5af2a',
      "user_id":2,
    });

    if (response == null) {
      ApiException.fromString("response null");
    }
    return ApiResponse2.fromJson(response,response);
  }
}