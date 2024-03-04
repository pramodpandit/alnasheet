import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';

class SallekBloc  extends Bloc{
  final SallekRepo repo;

  SallekBloc(this.repo);

  ValueNotifier<bool> isLoadingSallek = ValueNotifier(false);

  fetchCashVariance()async{
    try{

      isLoadingSallek.value = true;
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