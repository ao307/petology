import 'package:doctor_care/shared/api/remote/dio_helper.dart';
import 'package:doctor_care/shared/bloc_observer.dart';
import 'package:doctor_care/shared/components/constants.dart';
import 'package:doctor_care/shared/cubit/cubit.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:doctor_care/shared/themes/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'modules/auth/login_screen/login_screen.dart';


Widget startScreenDoctor = LoginScreen();

Future<void> startScreen() async {
  await Hive.initFlutter();
  final box = await Hive.openBox(boxName);
  final refreshToken = await box.get(refreshTokenDoctorBox);
  final accessToken = await box.get(accessTokenDoctorBox);
  final idPa = await box.get(idDoctorBox);

  if(refreshToken!=null&&accessToken!=null&&idPa!=null){
    startScreenDoctor=LoginScreen();
  }

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],);
  await EasyLocalization.ensureInitialized();
  await startScreen();
  await DioHelper.init();
  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        path: 'assets/translation',
        child: const MyApp(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (context.locale.toString() == 'ar_EG') {
    //   lang = 'ar';
    // } else {
    //   lang = 'en';
    // }
    ///
    // context
    //     .setLocale(const Locale('en', 'US'));
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: AppCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: startScreenDoctor,
          );
        },
      ),
    );
  }
}


// change mouse cursor to image every time we move the cursor
