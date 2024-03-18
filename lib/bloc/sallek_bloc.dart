import 'package:alnasheet/bloc/bloc.dart';
import 'package:alnasheet/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';

class SallekBloc  extends Bloc{
  final SallekRepo repo;

  SallekBloc(this.repo);

  ValueNotifier<List?> sallekList = ValueNotifier(null);
  ValueNotifier<bool> isLoadingSallek = ValueNotifier(false);

  getSallekList(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      isLoadingSallek.value = true;
      var result = await repo.fetchSallekList(context);
      if(result['success'].toString() == "1"){
        sallekList.value = result['data'];
      }else{
        print('token destroye :$result');
      }
    }catch(e,s){
      if(e.toString() =='Token has been expired'){
        toast('Session Expired');
        LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
        pref.clear();
      }
      debugPrint('token print$e');
      debugPrint('token resonse print$s');
    }finally{
      isLoadingSallek.value = false;
    }
  }

}