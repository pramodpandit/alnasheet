import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class ExcessFuelListRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  ExcessFuelListRepo(this.prefs, this._api);


  Future fetchExcessFuelList(context) async {
    var response = await _api.postRequest(context,"get_excess_fuel_list", {
      "token": prefs.getString("utoken"),
      "user_id": prefs.getString("uid"),
    });

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response['result'];
  }
}