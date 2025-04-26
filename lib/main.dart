import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/Shared/Cubit/statues.dart';
import 'package:news_app/Shared/network/local/cash_helper.dart';
import 'package:news_app/Shared/network/remote/dio_helper.dart';
import 'package:news_app/layouts/layouts_screen.dart';
import 'Shared/Cubit/my_bloc_opserver.dart';


Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CashHelper.init();
  bool? isWhiteMode = await CashHelper.get(key: 'isWhiteMode');
  bool? isArabicMode = await CashHelper.get(key: "isArabicMode");
  runApp( MyApp(isWhiteMode ?? false, isArabicMode ?? false));
}

class MyApp extends StatelessWidget {
  final bool isWhiteMode;
  final bool isArabicMode;
  const MyApp(this.isWhiteMode,this.isArabicMode, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>AppCubit()..getBusinessData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
                textDirection: AppCubit.get(context).isArabicMode ? TextDirection.rtl : TextDirection.ltr,
                child: const LayoutsScreen(),
            ),
            theme:ThemeData(
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              primarySwatch: Colors.blue,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                showSelectedLabels: true,
                showUnselectedLabels: true,

              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light
                ),
                backgroundColor:HexColor('333739'),
                elevation: 0,
                titleTextStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              primarySwatch: Colors.blue,
              bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey,
                  selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  backgroundColor: HexColor('333739'),
                  elevation: 2
              ),
              scaffoldBackgroundColor: HexColor('333739'),
            ),
            themeMode: AppCubit.get(context).isWhiteMode ?ThemeMode.light:ThemeMode.dark,
          );
        },
      ),
    );



  }
}

