import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class TrafficFineRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  TrafficFineRepo(this.prefs, this._api);


  Future fetchTrafficFineList(context) async {
    var response = await _api.postRequest(context,"get_traffic_fine_list", {
      "token": prefs.getString("utoken"),
      "user_id": prefs.getString("uid"),
    });

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response['result'];
  }
}