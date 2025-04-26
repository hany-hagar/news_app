import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/Shared/Cubit/statues.dart';
import 'package:news_app/Shared/components/components.dart';
import 'package:news_app/Shared/components/empty.dart';
import 'package:news_app/Shared/components/failed.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var list = AppCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! GetBusinessDataLoadingState,
          builder: (context) {
            if (state is GetBusinessDataErrorState) {
              return const FailedScreen();
            } else {
              if (list.isEmpty) {
                return const EmptyScreen();
              } else {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder:
                      (context, index) =>
                          defaultArticleContainer(list[index], context),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 10),
                  itemCount: list.length,
                );
              }
            }
          },
          fallback:
              (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
