import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:english_mastery/application/home_bloc/home_bloc.dart';
import 'package:english_mastery/application/profile_setup_bloc/profile_setup_bloc.dart';
import 'package:english_mastery/application/splash_bloc/splash_bloc.dart';
import 'package:english_mastery/application/writing_bloc/writing_bloc.dart';
import 'package:english_mastery/infrastructure/writing1_repo.dart';
import 'package:english_mastery/presentation/splash_view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      debugShowFloatingThemeButton: true,
      light: ThemeData.light(useMaterial3: false),
      dark: ThemeData.dark(useMaterial3: false),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<Writing1Repo>(
            create: (context) => Writing1Repo(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SplashBloc(),
            ),
            BlocProvider(
              create: (context) => ProfileSetupBloc(),
            ),
            BlocProvider(
              create: (context) => HomeBloc(),
            ),
            BlocProvider(
              create: (context) => WritingBloc(
                writing1Repo: context.read<Writing1Repo>(),
              ),
            ),
          ],
          child: GetMaterialApp(
            title: 'English Mastery',
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            home: SplashScreenView(),
          ),
        ),
      ),
    );
  }
}
