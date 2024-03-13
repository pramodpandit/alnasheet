import 'package:alnasheet/bloc/bloc.dart';
import 'package:alnasheet/data/repository/excess_fuel_list_repo.dart';
import 'package:alnasheet/data/repository/resignation_list_repo.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';

class ResignationListBloc extends Bloc{
  final ResignationListRepo repo;

  ResignationListBloc(this.repo);

  ValueNotifier<List?> resignationList = ValueNotifier(null);

  getResignationList()async{
    try{
      var result = await repo.fetchResignationList();
      if(result['success'].toString() == "1"){
        resignationList.value = result['data'];
      }
    }catch(e,s){
      debugPrint('$e');
      debugPrint('$s');
    }
  }

}