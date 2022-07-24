abstract class AppStates {}

class HospitalAppInitialState extends AppStates {}

class HospitalAppChangeBottomNavBarState extends AppStates {}

class HospitalAppChangeThemeState extends AppStates {}

class DoctorAppAnyState extends AppStates {}

///
class LoginLoading extends AppStates {}

class LoginSuccess extends AppStates {}

class LoginError extends AppStates {
  final String? error;

  LoginError({this.error});
}

///

class FetchDoctorDataLoading extends AppStates {}

class FetchDoctorDataSuccess extends AppStates {}

class FetchDoctorDataError extends AppStates {
  final String? error;

  FetchDoctorDataError({this.error});
}
