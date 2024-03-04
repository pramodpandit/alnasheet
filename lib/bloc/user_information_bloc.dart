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

  UserInformation()async{
    try{

      isLoadingUserInformation.value = true;
      var result = repo.Information();
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