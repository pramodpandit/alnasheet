import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Utils/message_handler.dart';
import '../data/repository/cash_variance_repo.dart';
import '../view/auth/login_screen.dart';

class CashVarianceBloc extends Bloc{
  final CashVariance repo;

  CashVarianceBloc(this.repo);


  ValueNotifier<bool> isLoadingCashVariance = ValueNotifier(false);
  ValueNotifier<List?> cashVariance = ValueNotifier([]);

  fetchCashVariance(BuildContext context)async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    try {
      isLoadingCashVariance.value = true;
      var result = await repo.cashVariance();
      print('user date:$result');
      if (result['result']['success'] == 1) {
        cashVariance.value = result['result']['data'];
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