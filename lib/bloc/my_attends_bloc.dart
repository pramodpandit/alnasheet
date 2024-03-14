import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/my_attends_repo.dart';
import '../data/repository/sallek_repo.dart';
import '../view/auth/login_screen.dart';

class MyAttendsBloc  extends Bloc{
  final MyAttendsRepo repo;

  MyAttendsBloc(this.repo);

  ValueNotifier<bool> isLoadingSallek = ValueNotifier(false);

  fetchCashVariance(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{

      isLoadingSallek.value = true;
      var result = repo.cashVariance();
      print(result);
      // if(result.status == 1){
      //
      // }
    }catch(e,s){
      toast('Session Expired');
      LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
      pref.clear();
      debugPrint('token print$e');
      debugPrint('token resonse print$s');
      debugPrint('$e');
      debugPrint('$s');
    }
  }


}