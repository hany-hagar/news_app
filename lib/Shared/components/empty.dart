import 'package:flutter/material.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
   AppCubit cubit = AppCubit.get(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.hourglass_empty, size: 100, color: Colors.red),
          const SizedBox(height: 20),
          Text(
            cubit.isArabicMode
                ? 'لا توجد مقالات متاحة'
                :'No Artical Available',
            style: TextStyle(
              fontSize: 24,
              color:
                  cubit.isWhiteMode
                      ? Colors.black
                      : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}