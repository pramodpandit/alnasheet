import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Utils/message_handler.dart';
import '../data/repository/Deduction_repo.dart';
import '../view/auth/login_screen.dart';

class DeductionBloc extends Bloc{
  final DeductionRepo repo;

  DeductionBloc(this.repo);


  ValueNotifier<bool> isLoadingCashVariance = ValueNotifier(false);
  ValueNotifier<List?> deduction = ValueNotifier([]);

  fetchdeductionVariance(BuildContext context)async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      isLoadingCashVariance.value = true;
      var result = await repo.deductionData();
      print('user date:$result');
      if (result['result']['success'] == 1) {
        deduction.value = result['result']['data'];
      } else {
        showMessage(MessageType.error('Something went wrong'));
      }
    } catch (e, s) {
      toast('Session Expired');
      LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
      pref.clear();
      debugPrint('token print$e');
      debugPrint('token resonse print$s');
      debugPrint('$e');
      debugPrint('$s');
    }
    finally {
      isLoadingCashVariance.value = false;
    }
  }
}