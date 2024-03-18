import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class ResignationListRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  ResignationListRepo(this.prefs, this._api);


  Future fetchResignationList(context) async {
    var response = await _api.postRequest(context,"get_da_resignation_list", {
      "token": prefs.getString("utoken"),
      "user_id": prefs.getString("uid"),
    });

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response['result'];
  }
}