import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../Utils/message_handler.dart';
import '../data/repository/Deduction_repo.dart';
import '../data/repository/cash_variance_repo.dart';

class DeductionBloc extends Bloc{
  final DeductionRepo repo;

  DeductionBloc(this.repo);


  ValueNotifier<bool> isLoadingCashVariance = ValueNotifier(false);
  ValueNotifier<List?> deduction = ValueNotifier([]);

  fetchdeductionVariance()async {
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
      debugPrint('$e');
      debugPrint('$s');
    }
    finally {
      isLoadingCashVariance.value = false;
    }
  }
}