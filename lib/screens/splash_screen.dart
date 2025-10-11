
import 'package:facts_app/bottom_nav.dart';
import 'package:facts_app/screens/privacy_policy_screen.dart';
import 'package:facts_app/screens/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: onNextPressed,
        child: const Icon(Icons.arrow_forward_ios),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Logo
            Center(
              child: Image.asset(
                'assets/images/splash_logo.jpg',
                width: 200,
                height: 200,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Welcome to Factopedia',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black),
            ),

            const SizedBox(height: 10),

            Text(
              "Discover. Learn. Amaze — One Fact at a Time!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            const Spacer(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Future<void> onNextPressed() async {
    final prefs = await SharedPreferences.getInstance();
    final agreed = prefs.getBool('agreedToTerms') ?? false;

    if (agreed) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNav()),
      );
    } else {
      showAgreementDialog();
    }
  }

  void showAgreementDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text("Terms & Conditions"),
        content: const Text(
          "By continuing, you agree to our Terms & Conditions and Privacy Policy.",
        ),
        actions: [
         Column(
           children: [ Row(
            mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
                    );
                  },
                  child: const Text("Privacy Policy"),
                ),
              
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TermsConditionsScreen()),
                  );
                },
                child: const Text("Terms & Conditions"),
              ),
              
                ]
              ),
         
            
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Decline"),
                    ),
                     ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('agreedToTerms', true);
                if (!mounted) return;
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const BottomNav()),
                );
              },
              child: const Text("Agree & Continue",style: TextStyle(color: Colors.white),),
            ),
          ],),
           ]),
         
        ],
      ),
    );
  }
}