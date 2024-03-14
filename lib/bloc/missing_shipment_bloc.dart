import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Utils/message_handler.dart';
import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../view/auth/login_screen.dart';

class MissingShipmentbloc  extends Bloc{
  final MissingShipmentRepo repo;

  MissingShipmentbloc(this.repo);

  ValueNotifier<bool> isLoadingMissingStatement = ValueNotifier(false);
  ValueNotifier<List?> MissingStatement = ValueNotifier([]);

  fetchMissingShipment(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
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
      toast('Session Expired');
      LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
      pref.clear();
      debugPrint('token print$e');
      debugPrint('token resonse print$s');
      debugPrint('$e');
      debugPrint('$s');
    }
    finally{
      isLoadingMissingStatement.value = false;
    }
  }


}