import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:alnasheet/view/spalsh_screen.dart';

import 'data/network/api_service.dart';
import 'data/network/interceptors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  final sharedPreferences = await SharedPreferences.getInstance();
  Dio dio = Dio();
  dio.interceptors.add(AppInterceptors());
  // dio.interceptors.add(DioCacheManager(CacheConfig(
  //   baseUrl: ApiService.host,
  //   defaultMaxAge: const Duration(minutes: 30),
  //   defaultMaxStale: const Duration(days: 2),
  // )).interceptor);
  final ApiService apiService = ApiService(dio);
  runApp( MyApp(sharedPreferences, apiService));
}

class MyApp extends StatelessWidget {
  const MyApp(this.prefs, this.apiService, {Key? key}) : super(key: key);

  final SharedPreferences prefs;
  final ApiService apiService;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, _) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          }),


    );
  }
}
