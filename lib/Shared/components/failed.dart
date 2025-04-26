import 'package:flutter/material.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';

class FailedScreen extends StatelessWidget {
  const FailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 100, color: Colors.red),
          const SizedBox(height: 20),
          Text(
             cubit.isArabicMode ?
                'فشل في تحميل المقالات' :
            'Failed to load Articals',
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
