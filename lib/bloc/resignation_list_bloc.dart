import 'package:alnasheet/bloc/bloc.dart';
import 'package:alnasheet/data/repository/excess_fuel_list_repo.dart';
import 'package:alnasheet/data/repository/resignation_list_repo.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';
import '../view/auth/login_screen.dart';

class ResignationListBloc extends Bloc{
  final ResignationListRepo repo;

  ResignationListBloc(this.repo);

  ValueNotifier<List?> resignationList = ValueNotifier(null);

  getResignationList(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      var result = await repo.fetchResignationList(context);
      if(result['success'].toString() == "1"){
        resignationList.value = result['data'];
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