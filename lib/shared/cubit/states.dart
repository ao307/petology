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

// UPLOAD REQUEST
class UploadRequestLoadingState extends AppStates {}

class UploadRequestSuccessState extends AppStates {}

class UploadRequestErrorState extends AppStates {
  final String error;

  UploadRequestErrorState(this.error);
}



// Get Filters REQUEST
class GetFiltersAndPetLoadingState extends AppStates {}

class GetFiltersAndPetSuccessState extends AppStates {}

class GetFiltersAndPetErrorState extends AppStates {
  final String error;

  GetFiltersAndPetErrorState(this.error);
}
// Post REQUEST
class PostRequestLoadingState extends AppStates {}

class PostRequestSuccessState extends AppStates {}

class PostRequestErrorState extends AppStates {
  final String error;

  PostRequestErrorState(this.error);
}