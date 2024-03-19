import 'package:alnasheet/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Utils/message_handler.dart';
import '../data/repository/Traffic_fine_repo.dart';
import '../data/repository/missing_shipment_repo.dart';
import '../data/repository/my_attends_repo.dart';
import '../data/repository/sallek_repo.dart';
import '../view/auth/login_screen.dart';

class MyAttendsBloc  extends Bloc{
  final MyAttendsRepo repo;

  MyAttendsBloc(this.repo);

  ValueNotifier<bool> isLoadingAtteds= ValueNotifier(false);
  ValueNotifier AttendsList = ValueNotifier(null);
  ValueNotifier<DateTime> month = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime> year = ValueNotifier(DateTime.now());
  updateMonth(DateTime value) => month.value = value;
  updateYear(DateTime value) => year.value = value;

  fetchAttendance(BuildContext context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String months = month.value.isToday == DateTime.now().isToday?0.toString(): DateFormat('MM').format(month.value);
    String years =year.value.isToday == DateTime.now().isToday?0.toString(): DateFormat('yyyy').format(year.value);
    try{
      isLoadingAtteds.value = true;
      var result = await repo.fetchattendsList(context,months,years);
      print('user date:$result');
      if(result['result']['success'].toString()=='1'){
        AttendsList.value = result['result']['data'];

      }else{
        showMessage(MessageType.error('Something went wrong'));
      }
    }catch(e,s){
      if(e.toString() =='Token has been expired'){
        toast('Session Expired');
        LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
        pref.clear();
      }

      debugPrint('$e');
      debugPrint('$s');
    }
    finally{
      isLoadingAtteds.value = false;
    }
  }



  acceptAttend(BuildContext context,String date)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      isLoadingAtteds.value = true;
      var result = await repo.attendsAgree(context,date);

      if(result['result']['success'].toString()=='1'){
        AttendsList.value = null;
        fetchAttendance(context);
        toast('Punched in success');
      }else{
        showMessage(MessageType.error('Something went wrong'));
      }
    }catch(e,s){
      if(e.toString() =='Token has been expired'){
        toast('Session Expired');
        LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
        pref.clear();
      }
      debugPrint('token print$e');
      debugPrint('token resonse print$s');
      debugPrint('user$e');
      debugPrint('$s');
    }
    finally{
      isLoadingAtteds.value = false;
    }
  }
  TextEditingController disputeText = TextEditingController();
  acceptdispute(BuildContext context, String date)async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    try{
      isLoadingAtteds.value = true;
      var result = await repo.attensdispute(context,date,disputeText.text );
      if(result['result']['success'].toString()=='1'){
        toast('Dispute raised');
        Navigator.of(context).pop();
        AttendsList.value = null;
        fetchAttendance(context);
      }else{
        showMessage(MessageType.error('Something went wrong'));
      }
    }catch(e,s){
      if(e.toString() =='Token has been expired'){
        toast('Session Expired');
        LoginScreen().launch(context,isNewTask: true,pageRouteAnimation: PageRouteAnimation.Fade);
        pref.clear();
      }
      debugPrint('token print$e');
      debugPrint('token resonse print$s');
      debugPrint('user$e');
      debugPrint('$s');
    }
    finally{
      isLoadingAtteds.value = false;
    }
  }



}