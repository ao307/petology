abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppAnyState extends AppStates {}

// FIRST SECTION
class HomeStaticLoadingState extends AppStates {}

class HomeStaticSuccessState extends AppStates {}

class HomeStaticErrorState extends AppStates {
  final String error;

  HomeStaticErrorState(this.error);
}

// FIRST SECTION
class AuthLoadingState extends AppStates {}

class AuthSuccessState extends AppStates {}

class AuthErrorState extends AppStates {
  final String error;

  AuthErrorState(this.error);
}
