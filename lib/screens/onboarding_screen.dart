import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Facts App!',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Column(
                  children: [
                    Text(
                      'How to use the app?',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '1. *Swipe Through Facts*:\n Get a new random fact every time you open the app and swipe vertically to explore more.',
                      style: TextStyle(color: Colors.black,),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '2. *Explore All Categories*:\n Tap the Categories tab in the bottom navigation bar to view all available categories and discover facts related to each.',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '3. *Select Preferred Categories*:\nGo to Settings > Category Preferences to choose the types of facts you want to see (e.g., Science, Psychology, Technology)',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '4. *Save Favorites*:\nTap the heart icon on any fact card to mark it as a favorite. You can view your saved facts later in favourites tab.',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '5. *Copy & Share Easily*: \nUse the copy or share buttons on each card to save or share facts with friends.',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '6. *Fun & Educational Quizzes*: \n "Test your knowledge with fun quizzes and learn new facts as you play!"',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                        '7. *Theme Customization*: \n "Head to Settings to switch between light/dark mode(By default the app use system theme)\n For better experience use light mode."',
                        style: TextStyle(color: Colors.black)),
                    SizedBox(height: 5),
                    Text(
                      '8. *Font Size Customization*: \n "Head to Settings to adjust font size for better readability."',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => _completeOnboarding(context),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
