import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../Utils/message_handler.dart';
import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';

class MissingShipmentbloc  extends Bloc{
  final MissingShipmentRepo repo;

  MissingShipmentbloc(this.repo);

  ValueNotifier<bool> isLoadingMissingStatement = ValueNotifier(false);
  ValueNotifier<List?> MissingStatement = ValueNotifier([]);

  fetchMissingShipment()async{
    try{
      isLoadingMissingStatement.value = true;
      var result = await repo.missingShipment();
      print('user date:$result');
      if(result['result']['success'].toString()=='1'){
        MissingStatement.value = result['result']['data'];

      }else{
        showMessage(MessageType.error('Something went wrong'));
      }
    }catch(e,s){
      debugPrint('$e');
      debugPrint('$s');
    }
    finally{
      isLoadingMissingStatement.value = false;
    }
  }


}