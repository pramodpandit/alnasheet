import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class DeductionRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  DeductionRepo(this.prefs, this._api);


  Future deductionData() async {

    var response = await _api.postRequest("get_other_deduction_list", {
      "token":prefs.getString('utoken'),
      "user_id":prefs.getString('uid'),
    });

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response;
  }
}