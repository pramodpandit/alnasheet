import 'package:alnasheet/bloc/bloc.dart';
import 'package:alnasheet/data/model/api_response.dart';
import 'package:alnasheet/data/repository/AuthRepository.dart';
import 'package:alnasheet/view/presentation/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

class AuthBloc extends Bloc{
  AuthRepository repo ;
  AuthBloc(this.repo);

  ValueNotifier<bool> loginLoading = ValueNotifier(false);
  ValueNotifier<bool> securePassword = ValueNotifier(false);
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login(BuildContext context)async{
    loginLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> data = {
      "username" : username.text,
      "password" : password.text,
      "gcm_id" : "1234555",
    };
    try{
      var result = await repo.loginToDashboard(data);
      prefs.setString("uid", result['result']['data']['id']);
      prefs.setString("utoken", result['result']['data']['token']);
      if(result['result']['success'] == 1){
        DashboardScreen().launch(context,pageRouteAnimation: PageRouteAnimation.SlideBottomTop,isNewTask: true);
      }
    }catch(e){
      print("the error $e");
    }finally{
      loginLoading.value = false;
    }
  }

}