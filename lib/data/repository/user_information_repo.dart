import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class UserInformationRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  UserInformationRepo(this.prefs, this._api);


  Future<ApiResponse2> Information() async {
    var response = await _api.postRequest("get_user_info", {
     // "token":'f9a3e60964a3ffef05050dbeb0e5af2a',
      "user_id":2,
    });
    print('response data: ${response}');

    if (response == null) {
      ApiException.fromString("response null");
    }
    return ApiResponse2.fromJson(response,response);
  }
}