import 'package:assigment_5/config/app_router.dart';
import 'package:assigment_5/cubits/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'This Go Router',
          theme: ThemeData(brightness: Brightness.dark),
          routerConfig: AppRouter(context.read<LoginCubit>()).router,
        );
      }),
    );
  }
}
