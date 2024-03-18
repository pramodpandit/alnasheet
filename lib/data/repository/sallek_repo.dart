import 'package:nb_utils/nb_utils.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class SallekRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  SallekRepo(this.prefs, this._api);


  Future fetchSallekList(context) async {
    var response = await _api.postRequest(context,"get_sallack_list", {
      "token": prefs.getString("utoken"),
      "user_id": prefs.getString("uid"),
    });
    print('data toke${response}');
    if (response == null) {
      ApiException.fromString("response null");
    }
    return response['result'];
  }
}