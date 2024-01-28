import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_arch_demo/presentation/ui/pages/home/home_page.dart';
import 'package:im_arch_demo/remote/base/api_provider.dart';
import 'package:im_arch_demo/presentation/bloc/home_bloc/home_cubit.dart';
import 'package:im_arch_demo/styles/app_theme.dart';

import 'data/repository/home_repo_impl.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IM Arch Demo',
      theme: AppTheme.lightTheme, // Use the light theme
      home:  BlocProvider(
        create: (context) => HomeCubit(),
        child: HomePage(),
      ),
    );
  }
}