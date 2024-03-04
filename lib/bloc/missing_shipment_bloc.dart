import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';

class MissingShipmentbloc  extends Bloc{
  final MissingShipmentRepo repo;

  MissingShipmentbloc(this.repo);

  ValueNotifier<bool> isLoadingTrafficFine = ValueNotifier(false);

  fetchCashVariance()async{
    try{

      isLoadingTrafficFine.value = true;
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