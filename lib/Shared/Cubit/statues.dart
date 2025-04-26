abstract class AppStates {}
class InitialState extends AppStates {}
class BottomNavBarState extends AppStates {}
class ChangeCurrentModeState extends AppStates {}
class ChangeCurrentLanguageState extends AppStates {}
class GetBusinessDataLoadingState extends AppStates{}
class GetBusinessDataSuccesState extends AppStates {}
class GetBusinessDataErrorState extends AppStates {
  final String error;
  GetBusinessDataErrorState(this.error);
}
class GetSportsDataLoadingState extends AppStates{}
class GetSportsDataSuccesState extends AppStates {}
class GetSportsDataErrorState extends AppStates {
  final String error;
  GetSportsDataErrorState(this.error);
}
class GetScienceDataLoadingState extends AppStates{}
class GetScienceDataSuccesState extends AppStates {}
class GetScienceDataErrorState extends AppStates {
  final String error;
  GetScienceDataErrorState(this.error);
}
class GetSearchDataLoadingState extends AppStates{}
class GetSearchDataSuccesState extends AppStates {}
class GetSearchDataErrorState extends AppStates {
   final String error;
   GetSearchDataErrorState(this.error);
}
