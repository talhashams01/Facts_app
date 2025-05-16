// import 'package:facts_app/provider/font_size_provider.dart';
// import 'package:facts_app/provider/theme_provider.dart';
// import 'package:facts_app/provider/category_preference_provider.dart';
// import 'package:facts_app/screens/about_app_screen.dart';
// import 'package:facts_app/screens/privacy_policy_screen.dart';
// import 'package:facts_app/screens/terms_condition_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final isDark = themeProvider.value == ThemeMode.dark;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Settings')),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ListView(
//           children: [

//             // Dark Mode Card
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               child: ListTile(
//                 leading: const Icon(Icons.dark_mode),
//                 title: const Text('Dark Mode'),
//                 trailing: Switch(
//                   value: isDark,
//                   onChanged: (value) => themeProvider.toggleTheme(value),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Font Size Card
//             Consumer<FontSizeProvider>(
//               builder: (context, fontProvider, _) {
//                 return Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                   child: ListTile(
//                     leading: const Icon(Icons.text_fields),
//                     title: const Text("Font Size"),
//                     subtitle: Text(
//                       fontProvider.fontSize == 14
//                           ? "Small"
//                           : fontProvider.fontSize == 16
//                               ? "Medium"
//                               : "Large",
//                     ),
//                     trailing: DropdownButton<double>(
//                       value: fontProvider.fontSize,
//                       underline: const SizedBox(),
//                       items: const [
//                         DropdownMenuItem(value: 14, child: Text("Small")),
//                         DropdownMenuItem(value: 16, child: Text("Medium")),
//                         DropdownMenuItem(value: 20, child: Text("Large")),
//                       ],
//                       onChanged: (value) {
//                         if (value != null) {
//                           fontProvider.setFontSize(value);
//                         }
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 16),

//             // Category Preferences Header
//             Row(
//               children: const [
//                 Icon(Icons.category),
//                 SizedBox(width: 8),
//                 Text(
//                   'Category Preferences',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             // Category Preference Checkboxes
//             Consumer<CategoryPreferenceProvider>(
//               builder: (context, categoryProvider, _) {
//                 final categories = categoryProvider.allCategories;
//                 final selected = categoryProvider.selectedCategories;

//                 return Column(
//                   children: categories.map((category) {
//                     final isSelected = selected.contains(category);
//                     return Card(
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       child: CheckboxListTile(
//                         title: Text(category),
//                         value: isSelected,
//                         onChanged: (_) => categoryProvider.toggleCategory(category),
//                       ),
//                     );
//                   }).toList(),
//                 );
//               },
//             ),

//             const SizedBox(height: 16),

//             // Share App
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               child: ListTile(
//                 leading: const Icon(Icons.share),
//                 title: const Text('Share App'),
//                 onTap: () {
//                   Share.share('Check out this amazing facts app: https://example.com');
//                 },
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Privacy Policy
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               child: ListTile(
//                 leading: const Icon(Icons.privacy_tip),
//                 title: const Text('Privacy Policy'),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
//                 },
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Terms & Conditions
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               child: ListTile(
//                 leading: const Icon(Icons.rule),
//                 title: const Text('Terms & Conditions'),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => const TermsConditionsScreen()));
//                 },
//               ),
//             ),

//             const SizedBox(height: 10),

//             // About App
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               child: ListTile(
//                 leading: const Icon(Icons.info_outline),
//                 title: const Text('About App'),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => const AboutAppScreen()));
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:facts_app/provider/font_size_provider.dart';
import 'package:facts_app/provider/theme_provider.dart';
import 'package:facts_app/provider/category_preference_provider.dart';
import 'package:facts_app/screens/about_app_screen.dart';
import 'package:facts_app/screens/privacy_policy_screen.dart';
import 'package:facts_app/screens/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
 import 'package:url_launcher/url_launcher.dart';
 

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
 




Future<void> sendFeedbackEmail() async {
  final String subject = Uri.encodeComponent('App Feedback');
  final String body = Uri.encodeComponent(
      'Hi,\n\nI would like to share some feedback about your app...\n'
      );

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'talhashamsdev101@gmail.com', // Replace with your email
    query: 'subject=$subject&body=$body',
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch email client';
  }
}
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [

            // Dark Mode Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: isDark,
                  onChanged: (value) => themeProvider.toggleTheme(value),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Font Size Card
            Consumer<FontSizeProvider>(
              builder: (context, fontProvider, _) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: const Icon(Icons.text_fields),
                    title: const Text("Font Size"),
                    subtitle: Text(
                      fontProvider.fontSize == 14
                          ? "Small"
                          : fontProvider.fontSize == 16
                              ? "Medium"
                              : "Large",
                    ),
                    trailing: DropdownButton<double>(
                      value: fontProvider.fontSize,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(value: 14, child: Text("Small")),
                        DropdownMenuItem(value: 16, child: Text("Medium")),
                        DropdownMenuItem(value: 20, child: Text("Large")),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          fontProvider.setFontSize(value);
                        }
                      },
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Category Preferences Header
            Row(
              children: const [
                Icon(Icons.category),
                SizedBox(width: 8),
                Text(
                  'Category Preferences',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Category Preference Checkboxes (no cards)
            Consumer<CategoryPreferenceProvider>(
              builder: (context, categoryProvider, _) {
                final categories = categoryProvider.allCategories;
                final selected = categoryProvider.selectedCategories;

                return Column(
                  children: categories.map((category) {
                    final isSelected = selected.contains(category);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: CheckboxListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        tileColor: Theme.of(context).cardColor.withOpacity(0.05),
                        title: Text(category),
                        value: isSelected,
                        onChanged: (_) => categoryProvider.toggleCategory(category),
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            const SizedBox(height: 16),

            // Share App
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share App'),
                onTap: () {
                  Share.share('Check out this amazing facts app: https://example.com');
                },
              ),
            ),

            const SizedBox(height: 10),

            // Privacy Policy
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
                },
              ),
            ),

            const SizedBox(height: 10),

            // Terms & Conditions
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(Icons.rule),
                title: const Text('Terms & Conditions'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TermsConditionsScreen()));
                },
              ),
            ),

            const SizedBox(height: 10),

            // Feedback
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Give Feedback'),
                onTap: () {
                 sendFeedbackEmail();
                },
              ),
            ),

            const SizedBox(height: 10),

            // About App
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('About App'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AboutAppScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}