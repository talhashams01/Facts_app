import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms & Conditions')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
Terms & Conditions

By using this app, you agree to the following terms:

1. *Usage*: This app is intended for educational and entertainment purposes only. 
2. *Content Accuracy*: While we strive to provide accurate facts, we do not guarantee their absolute correctness.
3. *User Responsibility*: Users are responsible for how they use the content within the app.
4. *Modifications*: We reserve the right to change or remove features at any time without notice.
5. *Intellectual Property*: All facts and content presented in this app are either original or publicly available information.
6. *No Liability*: We are not liable for any loss or damage arising from the use of this app.

If you do not agree with any part of these terms, please discontinue use of the app.

Thank you for your understanding and support!
            ''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}