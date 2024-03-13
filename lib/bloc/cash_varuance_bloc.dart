import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../data/repository/cash_variance_repo.dart';

class CashVarianceBloc extends Bloc{
  final CashVariance repo;

  CashVarianceBloc(this.repo);


  ValueNotifier<bool> isLoadingCashVariance = ValueNotifier(false);

  fetchCashVariance()async{
    try{
      isLoadingCashVariance.value = true;
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