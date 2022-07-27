// ignore_for_file: type_annotate_public_apis

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:doctor_care/models/home_model/about_model.dart';
import 'package:doctor_care/models/home_model/first_section_model.dart';
import 'package:doctor_care/models/home_model/footer_model.dart';
import 'package:doctor_care/models/home_model/how_to_care_friends.dart';
import 'package:doctor_care/modules/home_screen/home_screen.dart';
import 'package:doctor_care/modules/request_screen/request_screen.dart';
import 'package:doctor_care/shared/api/end_points.dart';
import 'package:doctor_care/shared/api/remote/dio_helper.dart';
import 'package:doctor_care/shared/components/constants.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Box box = Hive.box(boxName);

  // TODO: LIST OF APPBAR ITEMS
  final List<AppBarTxtButton> buttonsTitleList = [
    AppBarTxtButton(txt: 'about us', widget: HomeScreen(), currentIndex: 0),
    AppBarTxtButton(txt: 'categories', widget: HomeScreen(), currentIndex: 1),
    AppBarTxtButton(txt: 'services', widget: HomeScreen(), currentIndex: 2),
    AppBarTxtButton(txt: 'request', widget: RequestScreen(), currentIndex: 3),
  ];

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();

  int? indexOfHome;

  //TODO: to add the line under appbar txt button
  void setCurrentIndex(int index) {
    for (final category in buttonsTitleList) {
      category.selected = false;
    }
    indexOfHome = index;
    buttonsTitleList[index].selected = true;
    emit(AppAnyState());
  }

  static bool isDark = false;

  void changeThem() {
    // isDark = !isDark;
    //CacheHelper.setSaved(value: isDark, key: 'isDark');
    emit(AppAnyState());
  }

  FirstSectionModel? firstSectionModel;

  Future<void> getFirstSection() async {
    emit(HomeStaticLoadingState());
    await DioHelper.getData(
      url: firstSectionEP,
    ).then(
          (value) {
        firstSectionModel = FirstSectionModel.fromJson(value.data);
      },
    ).catchError(
          (onError) {
        emit(HomeStaticErrorState(onError.toString()));
      },
    );
  }

  AboutModel? aboutSectionModel;

  Future<void> getAboutSection() async {
    emit(HomeStaticLoadingState());
    await DioHelper.getData(
      url: aboutSectionEP,
    ).then(
          (value) {
        aboutSectionModel = AboutModel.fromJson(value.data);
      },
    ).catchError(
          (onError) {
        emit(HomeStaticErrorState(onError.toString()));
      },
    );
  }

  FooterModel? footerModel;

  Future<void> getFooter() async {
    emit(HomeStaticLoadingState());
    await DioHelper.getData(
      url: footerSectionEP,
    ).then(
          (value) {
        footerModel = FooterModel.fromJson(value.data);
      },
    ).catchError(
          (onError) {
        emit(HomeStaticErrorState(onError.toString()));
      },
    );
  }

  List<HowToCareFriends>? howToCareFriendsList;

  Future<void> howToCareFriend() async {
    emit(HomeStaticLoadingState());
    await DioHelper.getData(
      url: hCareSectionEP,
    ).then(
          (value) {
        howToCareFriendsList = value.data
            .map<HowToCareFriends>(
              (json) => HowToCareFriends.fromJson(json),
        )
            .toList();
        emit(HomeStaticSuccessState());
      },
    ).catchError(
          (onError) {
        emit(HomeStaticErrorState(onError.toString()));
      },
    );
  }

  // TODO: FETCH HOME DATA FUNCTION

  Future<void> getHome() async {
    await getFirstSection();
    await getFooter();
    await getAboutSection();
    await howToCareFriend();
  }
  // TODO: SIGN OUT FUNCTION
  Future<void> logout() async {
    await box.delete('token');
    AppCubit.accessToken = null;
    emit(AppInitialState());
  }

  // TODO: SIGNUP FUNCTION
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  TextEditingController? firstNameSignUp = TextEditingController();
  TextEditingController? lastNameSignUp = TextEditingController();
  TextEditingController? emailSignUp = TextEditingController();
  TextEditingController? passwordSignUp = TextEditingController();
  TextEditingController? phoneNumber = TextEditingController();
  TextEditingController? countrySignUp = TextEditingController();
  static String? accessToken;

  Future<void> signUp() async {
    emit(AuthLoadingState());
    await DioHelper.postData(
      endPoint: registerSectionEP,
      data: {
        "email": emailSignUp!.text,
        "password": passwordSignUp!.text,
        "firstName": firstNameSignUp!.text,
        "lastName": lastNameSignUp!.text,
        "phoneNumber": phoneNumber!.text,
        "country": countrySignUp!.text,
      },
    ).then(
          (value) {
        showToast(msg: 'created successfully');
        accessToken = value.data['accessToken'];
        box.put(accessTokenBox, accessToken);
        emit(AuthSuccessState());
      },
    ).catchError(
          (onError) {
        if (onError.toString().contains('409')) {
          showToast(msg: 'email already exist');
        } else {
          showToast(msg: "something went wrong");
        }
        printFullText(onError.toString());
        emit(AuthErrorState(onError.toString()));
      },
    );
  }

  // TODO: LOGIN FUNCTION
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  TextEditingController? emailLogin = TextEditingController();
  TextEditingController? passwordLogin = TextEditingController();

  Future<void> loginFun() async {
    emit(AuthLoadingState());
    await DioHelper.postData(
      endPoint: loginSectionEP,
      data: {"email": emailLogin!.text, "password": passwordLogin!.text},
    ).then(
          (value) {
        showToast(msg: 'login successfully');
        accessToken = value.data['accessToken'];
        box.put(accessTokenBox, accessToken);
        emit(AuthSuccessState());
      },
    ).catchError(
          (onError) {
        if (onError.toString().contains('401')) {
          showToast(msg: 'wrong email or password');
        } else {
          showToast(msg: "something went wrong");
        }
        emit(AuthErrorState(onError.toString()));
      },
    );
  }

  // TODO: GET CURRENT LON AND LAT FUNCTIONS

  Future<void> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openAppSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',);
    }

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      printFullText(value.latitude.toString());
      printFullText(value.longitude.toString());
      // get address from lat and long from geocode
    },
    );
  }

  // TODO: fETCH IMAGES AND CONVERT IT TO BASE64 FUNCTION
  Uint8List? fileBytes;
  List<String> imagesBase64 = [];
  void fetchRequestImages() async {
    imagesBase64.clear();
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      for(final image in images) {
        fileBytes = await image.readAsBytes();
        imagesBase64.add(base64Encode(fileBytes!));
      }
    }
    emit(AppAnyState());
  }

  // TODO: UPLOAD REQUEST FUNCTION
  Future<void> uploadRequestHelp() async {
    emit(UploadRequestLoadingState());
    await DioHelper.postData(
      endPoint: requestHelpEP,
      data:{
        "categoryId": -521075.08449715376,
        "imageBase64": "quis est",
        "location": "nulla",
        "phoneNumber": "commodo labore"
      },
    ).then(
          (value) {
        showToast(msg: 'request sent successfully');
        imagesBase64.cast();
        emit(UploadRequestSuccessState());
      },
    ).catchError(
          (onError) {
        showToast(msg: "something went wrong");
        emit(UploadRequestErrorState(onError.toString()));
      },
    );
  }
}
