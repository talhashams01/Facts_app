import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Factopedia - Discover Amazing Facts!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Factopedia is your daily dose of mind-blowing facts! From science and technology to nature and animals, explore fascinating information to boost your knowledge and curiosity — all in one place.',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            SizedBox(height: 24),
            Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            
            // Developer info in Row
            Row(
              children: [
                Text(
                  'Developed by : ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Talha Shams',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),

            // SizedBox(height: 8),
            // Text(
            //   'Talha is a Flutter and WordPress developer who loves building intuitive and meaningful apps for users. Factify is one of his creative projects aimed at making learning fun and simple for everyone.',
            //   style: TextStyle(fontSize: 15, height: 1.4),
            // ),
            SizedBox(height: 20),
            Text(
              'Thanks for using Factopedia!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}