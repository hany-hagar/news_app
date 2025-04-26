import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/Shared/Cubit/statues.dart';
import 'package:news_app/modules/search_screen.dart';
class LayoutsScreen extends StatelessWidget {
  const LayoutsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return  Scaffold(
              appBar:AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),));
                    },
                    icon: const Icon(Icons.search)),
                title: Text(
                  cubit.isArabicMode ? cubit.arScreensName[cubit.currentScreen] :cubit.screensName[cubit.currentScreen],
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        cubit.changeCurrentMode();
                      },
                      icon: cubit.isWhiteMode ? const Icon(Icons.brightness_4_outlined) : const Icon(Icons.brightness_4) ,),
                  IconButton(
                      onPressed:() => cubit.changeCurrentLanguage(),
                      icon:const Icon(Icons.translate),
                  ),
                ],
              ),
              body: cubit.screens[cubit.currentScreen],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex:cubit.currentScreen ,
                onTap: (value) => cubit.changeCurrentScreen(value),
                items:  [
                  BottomNavigationBarItem(
                      icon:Icon(Icons.business_center_outlined),
                      label: AppCubit.get(context).isArabicMode ? "أعمال":'Business'
                  ),
                  BottomNavigationBarItem(
                      icon:Icon(Icons.science_outlined),
                      label:  AppCubit.get(context).isArabicMode ? "علوم":'Science'
                  ),
                  BottomNavigationBarItem(
                      icon:Icon(Icons.sports_baseball_outlined),
                      label:  AppCubit.get(context).isArabicMode ? "رياضه":'Sports'
                  ),
                ],
              ),
            );
          },
      );
  }
}
