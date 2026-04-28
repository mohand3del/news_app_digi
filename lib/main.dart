import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_digi/core/network/dio_helper.dart';
import 'package:news_app_digi/features/home/presentation/news_bloc/cubit/get_news_cubit.dart';
import 'package:news_app_digi/features/home/presentation/screens/news_screen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App Digi',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BlocProvider(
            create: (context) => GetNewsCubit()..getTopHeadlines(),
            child: NewsScreen(),
          ),
        );
      },
    );
  }
}
