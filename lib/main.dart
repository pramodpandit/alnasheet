import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:alnasheet/view/spalsh_screen.dart';

import 'data/network/api_service.dart';
import 'data/network/interceptors.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await initialize();
  final sharedPreferences = await SharedPreferences.getInstance();
  Dio dio = Dio();
  final ApiService apiService = ApiService(dio);
  runApp(MyApp(sharedPreferences, apiService));
}

class MyApp extends StatelessWidget {
  const MyApp(this.prefs, this.apiService, {Key? key}) : super(key: key);

  final SharedPreferences prefs;
  final ApiService apiService;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
