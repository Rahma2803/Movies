import 'package:flutter/material.dart';
import 'package:movies/Auth/forgot_password.dart';
import 'package:movies/Auth/sign_in.dart';
import 'package:movies/Auth/sign_up.dart';
import 'package:movies/Screens/home_screen.dart';
import 'package:movies/Screens/movie_details_screen.dart';
import 'package:movies/onBoarding.dart/on_boarding_screen.dart';
import 'package:movies/onBoarding.dart/set_up.dart';
import 'package:movies/tabs/profile/update_profile.dart';
import 'package:movies/utitities/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies', 
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.signInRouteName: (context) => SignIn(),
        AppRoutes.onBoardingRouteName: (context) => OnBoardingScreen(),
        AppRoutes.setUpRouteName: (context) => SetUp(),
        AppRoutes.signUpRouteName: (context) => SignUp(),
        AppRoutes.forgotPasswordRouteName: (context) => ForgotPassword(),
        AppRoutes.movieDetailsRouteName: (context) => MovieDetailsScreen(),
        AppRoutes.updateProfileRouteName: (context) => UpdateProfile(),
      }
    );
  }
}

