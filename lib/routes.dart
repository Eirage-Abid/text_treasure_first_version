import 'package:flutter/material.dart';
import 'package:text_treasure_first_version/Screens/home_screen.dart';
import 'package:text_treasure_first_version/Screens/library_screen.dart';
import 'package:text_treasure_first_version/Screens/login_screen.dart';
import 'package:text_treasure_first_version/Screens/my_library.dart';
import 'package:text_treasure_first_version/Screens/onboarding/onboarding_screen.dart';
import 'package:text_treasure_first_version/Screens/signup-screen.dart';
import 'package:text_treasure_first_version/Screens/viewbook_screen.dart';




class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => OnboardingScreen(),
       'signup': (context) => SignUpScreen(),
      'login': (context) => LoginScreen(),
      'library': (context) => LibraryScreen(),
      'mylibrary': (context) => MyLibraryScreen(),
      'home': (context) => HomeScreen(),


      // New map screen
    };
  }
}
