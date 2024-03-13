import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';

class SallekBloc  extends Bloc{
  final SallekRepo repo;

  SallekBloc(this.repo);

  ValueNotifier<List?> sallekList = ValueNotifier(null);
  ValueNotifier<bool> isLoadingSallek = ValueNotifier(false);

  getSallekList()async{
    try{
      isLoadingSallek.value = true;
      var result = await repo.fetchSallekList();
      if(result['success'].toString() == "1"){
        sallekList.value = result['data'];
      }
    }catch(e,s){
      debugPrint('$e');
      debugPrint('$s');
    }finally{
      isLoadingSallek.value = false;
    }
  }

}