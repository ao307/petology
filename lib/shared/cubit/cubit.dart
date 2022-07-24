// ignore_for_file: type_annotate_public_apis

import 'package:doctor_care/shared/components/constants.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(HospitalAppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Box box = Hive.box(boxName);

  List<Widget> screens = [
    const Center(
      child: Text('main1'),
    ),
    const Center(
      child: Text('main2'),
    ),
    const Center(
      child: Text('main3'),
    ),
    const Center(
      child: Text('main4'),
    ),
  ];
  int currentIndex = 0;

  Future<void> changeIndex(int index) async {
    currentIndex = index;
    emit(HospitalAppChangeBottomNavBarState());
  }

  static bool isDark = false;

  void changeThem() {
    isDark = !isDark;
    //CacheHelper.setSaved(value: isDark, key: 'isDark');
    emit(HospitalAppChangeThemeState());
  }

}
