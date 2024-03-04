import 'package:alnasheet/Utils/message_handler.dart';
import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/sallek_repo.dart';
import '../data/repository/user_information_repo.dart';

class UserInformationBloc  extends Bloc{
  final UserInformationRepo repo;

  UserInformationBloc(this.repo);

  ValueNotifier<bool> isLoadingUserInformation = ValueNotifier(false);
  ValueNotifier informationData = ValueNotifier(null);

  UserInformation()async{
    try{
      isLoadingUserInformation.value = true;
      var result = await repo.information();
      print('user date:$result');
      if(result['result']['success']==1){
        informationData.value = result['result']['data']['user_info'];

      }else{
        showMessage(MessageType.error('Something went wrong'));
      }
    }catch(e,s){
      debugPrint('$e');
      debugPrint('$s');
    }
    finally{
      isLoadingUserInformation.value = false;
    }
  }


}