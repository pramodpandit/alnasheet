import 'package:alnasheet/data/repository/AuthRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:alnasheet/view/spalsh_screen.dart';
import 'data/network/api_service.dart';
import 'data/network/interceptors.dart';
import 'data/repository/Traffic_fine_repo.dart';
import 'data/repository/cash_variance_repo.dart';
import 'data/repository/missing_shipment_repo.dart';
import 'data/repository/my_attends_repo.dart';
import 'data/repository/sallek_repo.dart';
import 'data/repository/user_information_repo.dart';
import 'data/repository/vehicle_inspection_repo.dart';

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
    return MultiProvider(
      providers: [

        Provider<CashVariance>.value(value: CashVariance(prefs, apiService)),
        Provider<AuthRepository>.value(value: AuthRepository(prefs, apiService)),
        Provider<TrafficFineRepo>.value(value: TrafficFineRepo(prefs, apiService)),
        Provider<MissingShipmentRepo>.value(value: MissingShipmentRepo(prefs, apiService)),
        Provider<SallekRepo>.value(value: SallekRepo(prefs, apiService)),
        Provider<VehicleInspectionRepo>.value(value: VehicleInspectionRepo(prefs, apiService)),
        Provider<MyAttendsRepo>.value(value: MyAttendsRepo(prefs, apiService)),
        Provider<UserInformationRepo>.value(value: UserInformationRepo(prefs, apiService)),
        Provider<SharedPreferences>.value(value: prefs),
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
