// ignore_for_file: type_annotate_public_apis

import 'dart:convert';
import 'dart:typed_data';

import 'package:doctor_care/models/filters_model.dart';
import 'package:doctor_care/models/home_model/about_model.dart';
import 'package:doctor_care/models/home_model/first_section_model.dart';
import 'package:doctor_care/models/home_model/footer_model.dart';
import 'package:doctor_care/models/home_model/how_to_care_friends.dart';
import 'package:doctor_care/models/pets_model.dart';
import 'package:doctor_care/modules/home_screen/home_screen.dart';
import 'package:doctor_care/modules/request_screen/request_screen.dart';
import 'package:doctor_care/shared/api/end_points.dart';
import 'package:doctor_care/shared/api/remote/dio_helper.dart';
import 'package:doctor_care/shared/components/constants.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/states.dart';
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
    AppBarTxtButton(txt: 'home', widget: HomeScreen(), currentIndex: 0),
    AppBarTxtButton(txt: 'about us', widget: HomeScreen(), currentIndex: 1),
    AppBarTxtButton(txt: 'categories', widget: HomeScreen(), currentIndex: 2),
    AppBarTxtButton(txt: 'services', widget: HomeScreen(), currentIndex: 3),
    AppBarTxtButton(txt: 'request', widget: RequestScreen(), currentIndex: 4),
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

  // TODO: FUNCTIONS OF HOME DATA
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
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then(
      (value) async {
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
      for (final image in images) {
        fileBytes = await image.readAsBytes();
        imagesBase64.add(base64Encode(fileBytes!));
      }
    }
    emit(AppAnyState());
  }

  // TODO: UPLOAD REQUEST FUNCTION
  GlobalKey<FormState> formKeyRequestHelp = GlobalKey<FormState>();
  TextEditingController? categoryIdRequestHelp = TextEditingController();
  TextEditingController? locationRequestHelp = TextEditingController();
  TextEditingController? phoneNumberRequestHelp = TextEditingController();

  Future<void> uploadRequestHelp() async {
    emit(UploadRequestLoadingState());
    await DioHelper.postData(
      endPoint: requestHelpEP,
      data: {
        "categoryId": categoryIdRequestHelp!.text == "dog" ? 1 : 2,
        "imageBase64": "data:image/png;base64,${imagesBase64[0]}",
        "location": locationRequestHelp!.text,
        "phoneNumber": phoneNumberRequestHelp!.text,
      },
    ).then(
      (value) {
        showToast(msg: 'request sent successfully');
        imagesBase64.clear();
        categoryIdRequestHelp!.clear();
        locationRequestHelp!.clear();
        phoneNumberRequestHelp!.clear();
        emit(UploadRequestSuccessState());
      },
    ).catchError(
      (onError) {
        if (onError.toString().contains('401')) {
          showToast(msg: 'you must be logged in');
        } else {
          showToast(msg: "something went wrong");
        }
        printFullText(onError.toString());
        emit(UploadRequestErrorState(onError.toString()));
      },
    );
  }

  // TODO: GET FILTERS FUNCTION
  FiltersModel? filtersModel;

  Future<void> getFilterDropdowns(int id) async {
    emit(GetFiltersAndPetLoadingState());
    await DioHelper.getData(
      url: "$filterDropdownsEP$id",
    ).then((value) async {
      filtersModel = FiltersModel.fromJson(value.data);
      await getPets(id);
    }).catchError(
      (onError) {
        printFullText(onError.toString());
        emit(GetFiltersAndPetErrorState(onError.toString()));
      },
    );
  }

  List<PetsModel>? petsModel;

  // TODO: GET PETS FUNCTION
  Future<void> getPets(int id) async {
    await DioHelper.getData(
      url: "/categories/$id/pets",
    ).then(
      (value) {
        // printFullText(value.data.toString());
        petsModel =
            (value.data as List).map((i) => PetsModel.fromJson(i)).toList();
        emit(GetFiltersAndPetSuccessState());
      },
    ).catchError(
      (onError) {
        showToast(msg: "something went wrong in get pets");
        printFullText(onError.toString());
        emit(GetFiltersAndPetErrorState(onError.toString()));
      },
    );
  }

  //TODO: POST REQUEST FUNCTION
  GlobalKey<FormState> formKeyPostRequest = GlobalKey<FormState>();
  TextEditingController? categoryIdPostRequest = TextEditingController();
  TextEditingController? locationPostRequest = TextEditingController();
  TextEditingController? phoneNumberPostRequest = TextEditingController();
  TextEditingController? descriptionPostRequest = TextEditingController();
  TextEditingController? namePostRequest = TextEditingController();
  TextEditingController? yearPostRequest = TextEditingController();
  TextEditingController? monthPostRequest = TextEditingController();
  TextEditingController? breadPostRequest = TextEditingController();
  TextEditingController? colorPostRequest = TextEditingController();
  TextEditingController? sizePostRequest = TextEditingController();
  TextEditingController? hairPostRequest = TextEditingController();
  TextEditingController? houseTrainedPostRequest = TextEditingController();
  TextEditingController? carePostRequest = TextEditingController();

  Future<void> postRequestFun() async {
    emit(PostRequestLoadingState());
    DioHelper.postData(
      endPoint: petsRequestEP,
      data: {
        "pet": {
          "name": "bossy",
          "year": 2,
          "month": 7,
          "size": "small",
          "breed": "labrador",
          "gender": false,
          "hairLength": "small",
          "color": "black",
          "careBehavior": "yes",
          "houseTrained": false,
          "description":
              "Cats are similar in anatomy to other types of felids, they have a strong flexible body, quick reflexes, sharp teeth and retractable claws adapted to killing small prey, and have the ability to night vision and a well-developed sense of smell.",
          "location": "34 shenzhen road",
          "phone": "01155368336",
          "vaccinated": false,
          "categoryId": 2,
          "image": "data:image/png;base64,${imagesBase64[0]}"
        }
      },
    ).then((value) {
      showToast(msg: 'request sent successfully');
      emit(PostRequestLoadingState());
    }).catchError(
      (onError) {
        if (onError.toString().contains('401')) {
          showToast(msg: 'you must be logged in');
        } else {
          showToast(msg: "something went wrong");
        }
        printFullText(onError.toString());
        emit(PostRequestErrorState(onError.toString()));
      },
    );
  }
}
