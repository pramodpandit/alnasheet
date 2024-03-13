import 'package:alnasheet/data/network/api_exception.dart';
import 'package:alnasheet/data/network/api_service.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';

class AuthRepository{
  SharedPreferences pref;
  ApiService api;
  AuthRepository(this.pref,this.api);

  Future loginToDashboard(Map<String,dynamic> data)async{
    try{
      var response = api.postRequest("login", data);
      print("the response is ${response}");
      return response;
    }catch(e){
      print("the error is $e");
      throw e;
    }
  }

  Future forgotPasswordApi(Map<String,dynamic> data) async {
    var response = await api.postRequest("forgot_password", data);

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response['result'];
  }

  Future changePasswordApi(Map<String,dynamic> data)async{
    try{
      var response = api.postRequest("change_password", data);
      print("the response is ${response}");
      return response;
    }catch(e){
      print("the error is $e");
      throw e;
    }
  }
}