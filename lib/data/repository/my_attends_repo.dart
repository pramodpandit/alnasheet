
import 'package:alnasheet/view/auth/login_screen.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class MyAttendsRepo{
  final SharedPreferences prefs;
  final ApiService _api;
  MyAttendsRepo(this.prefs, this._api);


  Future fetchattendsList(context, month, year) async {
    var response = await _api.postRequest(context, "get_attendance_list", {
      "token": prefs.getString("utoken"),
      "user_id": prefs.getString("uid"),
      "month":month,
      "year":year
    });

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response;
  }
  Future attensdispute(context, date, remark) async {
    var response = await _api.postRequest(context,"raise_attendance_dispute", {
      "token": prefs.getString("utoken"),
      "user_id": prefs.getString("uid"),
      "attendance_date":date,
      "dispute_remark":remark
    });

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response;
  }
  Future attendsAgree(context, date,String value) async {
    var response = await _api.postRequest(context,"set_attendance_agreed", {
      "token": prefs.getString("utoken"),
      "user_id": prefs.getString("uid"),
      "attendance_date":date,
      "is_agree":value
    });
    if (response == null) {
      ApiException.fromString("response null");
    }
    return response;
  }
}