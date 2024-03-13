import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';

class TrafficFinebloc  extends Bloc{
  final TrafficFineRepo repo;

  TrafficFinebloc(this.repo);

  ValueNotifier<List?> trafficFineList = ValueNotifier(null);

  getTrafficFineList()async{
    try{
      var result = await repo.fetchTrafficFineList();
      if(result['success'].toString() == "1"){
          trafficFineList.value = result['data'];
      }
    }catch(e,s){
      debugPrint('$e');
      debugPrint('$s');
    }
  }


}