import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/Shared/Cubit/statues.dart';
import 'package:news_app/Shared/components/components.dart';
import 'package:news_app/Shared/components/default_text_field.dart';
import 'package:news_app/Shared/components/empty.dart';
import 'package:news_app/Shared/components/failed.dart';

var controller = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        controller.clear();
                        AppCubit.get(context).search.clear();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color:
                            AppCubit.get(context).isWhiteMode
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Top News',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            AppCubit.get(context).isWhiteMode
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: defaultTextField(
                    controller: controller,
                    prefixIcon: Icons.search,
                    title: 'Search',
                    keyboardType: TextInputType.text,
                    titleColor: AppCubit.get(context).isWhiteMode
                                ? Colors.black
                                : Colors.white,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Mustn\'t Empty';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (p0) {
                      AppCubit.get(context).getSearchData(value: p0);
                    },
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state is! GetSearchDataLoadingState,
                    builder: (context) {
                      if (state is GetSearchDataSuccesState) {
                        return Scaffold(
                          body:
                              list.isEmpty
                                  ? EmptyScreen()
                                  : SearchSuccessBody(list: list),
                        );
                      } else if (state is GetSearchDataErrorState) {
                        if(controller.text.isEmpty) {
                          return Container();
                        } else {
                        return FailedScreen();
                        }
                      } else {
                        return Container();
                      }
                    },
                    fallback:
                        (context) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: const LinearProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchSuccessBody extends StatelessWidget {
  const SearchSuccessBody({super.key, required this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => WebScreen(url: list[index]['url'],),))
            },
            child: defaultArticleContainer(list[index], context),
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: list.length,
    );
  }
}
