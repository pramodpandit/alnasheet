import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../view/auth/login_screen.dart';

class TrafficFinebloc  extends Bloc{
  final TrafficFineRepo repo;

  TrafficFinebloc(this.repo);

  ValueNotifier<List?> trafficFineList = ValueNotifier(null);

  getTrafficFineList(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      var result = await repo.fetchTrafficFineList(context,);
      if(result['success'].toString() == "1"){
          trafficFineList.value = result['data'];
      }
    }catch(e,s){
      if(e.toString() =='Token has been expired'){
        toast('Session Expired');
        LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
        pref.clear();
      }
      debugPrint('token print$e');
      debugPrint('token resonse print$s');
      debugPrint('$e');
      debugPrint('$s');
    }
  }


}