import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class CashVariance{
  final SharedPreferences prefs;
  final ApiService _api;
  CashVariance(this.prefs, this._api);


  Future cashVariance() async {
    var response = await _api.postRequest("get_cash_variance_list", {
     "token":prefs.getString('utoken'),
     "user_id":prefs.getString('uid'),
    });

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response;
  }
}