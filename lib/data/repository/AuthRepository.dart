import 'package:alnasheet/data/network/api_exception.dart';
import 'package:alnasheet/data/network/api_service.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/api_response.dart';

class AuthRepository{
  SharedPreferences pref;
  ApiService api;
  AuthRepository(this.pref,this.api);

  Future loginToDashboard(context,Map<String,dynamic> data)async{
    try{
      var response = api.postRequest(context,"login", data);
      print("the response is ${response}");
      return response;
    }catch(e){
      print("the error is $e");
      throw e;
    }
  }

  Future forgotPasswordApi(context,Map<String,dynamic> data) async {
    var response = await api.postRequest(context,"forgot_password", data);

    if (response == null) {
      ApiException.fromString("response null");
    }
    return response['result'];
  }

  Future changePasswordApi(context,Map<String,dynamic> data)async{
    try{
      var response = api.postRequest(context,"change_password", data);
      print("the response is ${response}");
      return response;
    }catch(e){
      print("the error is $e");
      throw e;
    }
  }
}