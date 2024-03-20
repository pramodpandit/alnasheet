import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Utils/message_handler.dart';
import '../data/repository/Deduction_repo.dart';
import '../view/auth/login_screen.dart';

class DeductionBloc extends Bloc{
  final DeductionRepo repo;

  DeductionBloc(this.repo);


  ValueNotifier<bool> isLoadingDeduction = ValueNotifier(false);
  ValueNotifier<List?> deduction = ValueNotifier([]);

  fetchdeductionVariance(BuildContext context)async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      isLoadingDeduction.value = true;
      var result = await repo.deductionData(context,);
      print('user date:$result');
      if (result['result']['success'] == 1) {
        deduction.value = result['result']['data'];
      } else {
        showMessage(MessageType.error('Something went wrong'));
      }
    } catch (e, s) {
      if(e.toString() =='Token has been expired'){
        toast('Session Expired');
        LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
        pref.clear();
      }
      debugPrint('token print$e');
      debugPrint('token resonse print$s');
      debugPrint('$e');
      debugPrint('$s');
    }
    finally {
      isLoadingDeduction.value = false;
    }
  }
}