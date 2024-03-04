import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';

class TrafficFinebloc  extends Bloc{
  final TrafficFineRepo repo;

  TrafficFinebloc(this.repo);

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