import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';
import '../data/repository/vehicle_inspection_repo.dart';
import '../view/auth/login_screen.dart';

class VehicleInspectionBloc  extends Bloc{
  final VehicleInspectionRepo repo;

  VehicleInspectionBloc(this.repo);

  ValueNotifier<bool> isLoadingVehicleInspection = ValueNotifier(false);

  fetchCashVariance(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{

      isLoadingVehicleInspection.value = true;
      var result = repo.cashVariance(context,);
      print(result);
      // if(result.status == 1){
      //
      // }
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