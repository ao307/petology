// ignore_for_file: type_annotate_public_apis

import 'package:doctor_care/modules/auth/login_screen/login_screen.dart';
import 'package:doctor_care/shared/components/constants.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Box box = Hive.box(boxName);

  final List<AppBarTxtButton> buttonsTitleList = [
    AppBarTxtButton(txt: 'about us', widget: LoginScreen(), currentIndex: 0),
    AppBarTxtButton(txt: 'categories', widget: LoginScreen(), currentIndex: 1),
    AppBarTxtButton(txt: 'services', widget: LoginScreen(), currentIndex: 2),
    AppBarTxtButton(txt: 'request', widget: LoginScreen(), currentIndex: 3),
  ];

  //TODO: to add the line under appbar txt button
  void setCurrentIndex(int index) {
    for (final category in buttonsTitleList) {
      category.selected = false;
    }
    buttonsTitleList[index].selected = true;
    emit(AppAnyState());
  }

  static bool isDark = false;

  void changeThem() {
   // isDark = !isDark;
    //CacheHelper.setSaved(value: isDark, key: 'isDark');
    emit(AppAnyState());
  }

  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  TextEditingController firstNameSignUp = TextEditingController();
  TextEditingController lastNameSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController reWritePasswordSignUp = TextEditingController();
  TextEditingController countrySignUp = TextEditingController();




}
