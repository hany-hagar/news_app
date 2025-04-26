// ignore_for_file: avoid_print
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/statues.dart';
import 'package:news_app/Shared/network/local/cash_helper.dart';
import 'package:news_app/Shared/network/remote/dio_helper.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/sports_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  int currentScreen = 0;
  bool isWhiteMode = true;
  bool isArabicMode = false;
  String country = 'us';
  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];
  List<String> screensName = ["Business News", "Science News", "Sports News"];
  List<String> arScreensName = [
    "الاخبار الاقتصادية",
    "الاخبار العلمية",
    "الاخبار الرياضية",
  ];
  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];

  String? apiKey = 'aac45c8d0ff64c1b8eb356a6d6f2e36e';

  void changeCurrentScreen(value) {
    currentScreen = value;
    emit(BottomNavBarState());
    if (currentScreen == 0) {
      if (business.isEmpty) {
        getBusinessData();
      }
    } else if (currentScreen == 1) {
      if (science.isEmpty) {
        getScienceData();
      }
    } else if (currentScreen == 2) {
      if (sports.isEmpty) {
        getSportsData();
      }
    }
  }

  void changeCurrentMode() {
    isWhiteMode = !isWhiteMode;
    CashHelper.putBool(
      key: 'isWhiteMode',
      value: isWhiteMode,
    ).then((value) => emit(ChangeCurrentModeState()));
  }

  void changeCurrentLanguage() {
    isArabicMode = !isArabicMode;
    isArabicMode ? country = 'eg' : country = 'us';
    CashHelper.putBool(
      key: 'isArabicMode',
      value: isArabicMode,
    ).then((value) => emit(ChangeCurrentModeState())).catchError((value) {
      log("Error in changeCurrentLanguage is : ${value.toString()}");
      emit(ChangeCurrentModeState());
    });
    business.clear();
    science.clear();
    sports.clear();
    if (currentScreen == 0) {
      getBusinessData();
    } else if (currentScreen == 1) {
      getScienceData();
    } else if (currentScreen == 2) {
      getSportsData();
    }
  }

  void getBusinessData() {
    emit(GetBusinessDataLoadingState());
    DioHelper()
        .getData(
          url: 'v2/top-headlines',
          query: {'country': country, 'category': 'business', 'apiKey': apiKey},
        )
        .then((value) {
          business = value.data['articles'];
          emit(GetBusinessDataSuccesState());
        })
        .catchError((onError) {
          log('Business Error is : ${onError.toString()}');
          emit(GetBusinessDataErrorState(onError.toString()));
        });
  }

  void getScienceData() {
    emit(GetScienceDataLoadingState());
    DioHelper()
        .getData(
          url: 'v2/top-headlines',
          query: {'country': country, 'category': 'science', 'apiKey': apiKey},
        )
        .then((value) {
          science = value.data['articles'];
          emit(GetScienceDataSuccesState());
        })
        .catchError((onError) {
          log('Science Error is : ${onError.toString()}');
          emit(GetScienceDataErrorState(onError.toString()));
        });
  }

  void getSportsData() {
    emit(GetSportsDataLoadingState());
    DioHelper()
        .getData(
          url: 'v2/top-headlines',
          query: {'country': country, 'category': 'sports', 'apiKey': apiKey},
        )
        .then((value) {
          sports = value.data['articles'];
          emit(GetSportsDataSuccesState());
        })
        .catchError((onError) {
          log('Sports Error is : ${onError.toString()}');
          emit(GetSportsDataErrorState(onError.toString()));
        });
  }

  void getSearchData({required String? value}) {
    // //https://newsapi.org/v2/everything?q=tesla&apiKey=8ab4af3f5593491e97683caab99e4240
    emit(GetSearchDataLoadingState());
    DioHelper()
        .getData(url: 'v2/everything', query: {'q': value, 'apiKey': apiKey})
        .then((value) {
          search = value.data['articles'];
          print(search[0]['title']);
          emit(GetSearchDataSuccesState());
        })
        .catchError((onError) {
          log('Search Error is : ${onError.toString()}');
          emit(GetSearchDataErrorState(onError.toString()));
        });
  }
}
