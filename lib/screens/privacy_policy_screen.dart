import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
Privacy Policy

Your privacy is important to us. This app does not collect or store any personal information. All preferences and favorites are stored locally on your device.

1. *No Data Collection*: We do not collect, store, or share any personal data.
2. *Local Preferences*: Font size, theme, and category choices are saved locally.
3. *Favorites*: Your favorite facts are only stored on your device.
4. *No Ads or Tracking*: We do not serve ads or track user behavior.
5. *Permission Use*: If permissions are requested (e.g., for sharing facts), they are only used for that specific purpose.

By using this app, you agree to this simple and transparent privacy policy.

Thank you for using our app!
            ''',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}