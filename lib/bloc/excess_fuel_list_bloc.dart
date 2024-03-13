import 'package:alnasheet/bloc/bloc.dart';
import 'package:alnasheet/data/repository/excess_fuel_list_repo.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';

class ExcessFuelListBloc extends Bloc{
  final ExcessFuelListRepo repo;

  ExcessFuelListBloc(this.repo);

  ValueNotifier<List?> excessFuelList = ValueNotifier(null);

  getExcessFuelList()async{
    try{
      var result = await repo.fetchExcessFuelList();
      if(result['success'].toString() == "1"){
        excessFuelList.value = result['data'];
      }
    }catch(e,s){
      debugPrint('$e');
      debugPrint('$s');
    }
  }

}