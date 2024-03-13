import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class UserInformationRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  UserInformationRepo(this.prefs, this._api);


  Future information() async {
    try {
      var response = await _api.postRequest("get_user_info", {
        "user_id": prefs.getString('uid'),
      });
      return response;
    } catch (e) {
      print("the error is $e");
      throw e;
    }
  }
}