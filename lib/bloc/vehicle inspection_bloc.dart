import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';
import '../data/repository/vehicle_inspection_repo.dart';

class VehicleInspectionBloc  extends Bloc{
  final VehicleInspectionRepo repo;

  VehicleInspectionBloc(this.repo);

  ValueNotifier<bool> isLoadingVehicleInspection = ValueNotifier(false);

  fetchCashVariance()async{
    try{

      isLoadingVehicleInspection.value = true;
      var result = repo.cashVariance();
      print(result);
      // if(result.status == 1){
      //
      // }
    }catch(e,s){
      debugPrint('$e');
      debugPrint('$s');
    }
  }


}