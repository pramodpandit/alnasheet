import 'package:alnasheet/bloc/bloc.dart';
import 'package:alnasheet/data/repository/excess_fuel_list_repo.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';
import '../view/auth/login_screen.dart';

class ExcessFuelListBloc extends Bloc{
  final ExcessFuelListRepo repo;

  ExcessFuelListBloc(this.repo);

  ValueNotifier<List?> excessFuelList = ValueNotifier(null);

  getExcessFuelList(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      var result = await repo.fetchExcessFuelList();
      if(result['success'].toString() == "1"){
        excessFuelList.value = result['data'];
      }
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