import 'package:flutter/material.dart';
import 'package:text_treasure_first_version/Screens/home_screen.dart';
import 'package:text_treasure_first_version/Screens/library_screen.dart';
import 'package:text_treasure_first_version/screens/onboarding/onboarding_page.dart';
import 'package:text_treasure_first_version/widgets/custom_button.dart';

import '../login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Your Personalized Reading Experience",
      "description":
      "Customize your reading journey with intuitive features designed just for you."
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Bookmark & Highlight",
      "description":
      "Easily mark important pages and highlight key text for quick reference."
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "Download for Offline Access",
      "description":
      "Save your favorite books and enjoy reading without an internet connection."
    },
  ];

  void _nextPage() {
    if (_currentPage == onboardingData.length - 1) {
      // Navigate to the login screen when "Continue" is pressed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
       // MaterialPageRoute(builder: (context) => HomeScreen()),
       // MaterialPageRoute(builder: (context) => LibraryScreen()),
      );
    } else {
      // Move to the next page
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
     // MaterialPageRoute(builder: (context) => HomeScreen()),
     // MaterialPageRoute(builder: (context) => LibraryScreen()),
    );
  }
  /*

  void _skipOnboarding(){
    Navigator.of(context).pushReplacementNamed('/login');

  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // PageView for onboarding screens
              Expanded(
                flex: 5, // Takes up 5 parts of screen height
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) => OnboardingPage(
                    image: onboardingData[index]["image"]!,
                    title: onboardingData[index]["title"]!,
                    description: onboardingData[index]["description"]!,
                  ),
                ),
              ),
            ],
          ),

          // Skip Button at Top Right
          Positioned(
            top: 40, // Adjust position based on device
            right: 20,
            child: TextButton(
              onPressed: _navigateToLogin,
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),


          // Bottom Black Section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),

              height: MediaQuery.of(context).size.height * 0.45, // Fixed height

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title and description
                  Column(
                    children: [
                      Text(

                        onboardingData[_currentPage]["title"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        onboardingData[_currentPage]["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  // Loading indicator & Next button
                  Column(
                    children: [
                   /*   CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                      SizedBox(height: 50),*/
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: _currentPage == onboardingData.length - 1
                              ? "Continue"
                              : "Next",
                          onPressed: _nextPage,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
