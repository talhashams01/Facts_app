
// import 'package:facts_app/data/facts_data.dart';
// import 'package:facts_app/screens/splash_screen.dart';
// //import 'package:facts_app/theme_provider.dart';
// import 'package:facts_app/provider/theme_provider.dart';


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await loadFacts();
  
//   runApp(
//     ChangeNotifierProvider(
//       create: (context)=> ThemeProvider(),
//     child:const  MainApp()),
//     );
    
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     return  MaterialApp(
//       title: 'Facts App',
//       //theme: ThemeData(primarySwatch: Colors.deepPurple,
      
//      // useMaterial3: true),
//      themeMode: themeProvider.value,
//      theme:  ThemeData.light(),
//      darkTheme:  ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//     );
//   }
// }




// import 'package:facts_app/data/facts_data.dart';
// import 'package:facts_app/provider/category_preference_provider.dart';
// //import 'package:facts_app/provider/category_preference_provider.dart';
// import 'package:facts_app/screens/splash_screen.dart';
// import 'package:facts_app/provider/theme_provider.dart';
// import 'package:facts_app/provider/font_size_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await loadFacts();
  
//     final categoryProvider = CategoryPreferenceProvider();
//     await  categoryProvider.loadPreferences(categoryProvider.allCategories); 
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ThemeProvider()),
//         ChangeNotifierProvider(create: (_) => FontSizeProvider()),
//       ChangeNotifierProvider(create: (_) => CategoryPreferenceProvider()),
//       ],
//       child: const MainApp(),
//     ),
//   );
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp(
//       title: 'Facts App',
//       themeMode: themeProvider.value,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//     );
//   }
// }



// import 'package:facts_app/data/facts_data.dart';
// import 'package:facts_app/provider/category_preference_provider.dart';
// import 'package:facts_app/screens/splash_screen.dart';
// import 'package:facts_app/provider/theme_provider.dart';
// import 'package:facts_app/provider/font_size_provider.dart';
// import 'package:facts_app/services/notification_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:math';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:facts_app/screens/onboarding_screen.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   tz.initializeTimeZones();
//   await loadFacts();
//   NotificationService.initialize();
//   //await scheduleDailyFactNotification();
//   //await NotificationService.scheduleDailyFactNotification();
//   await NotificationService.scheduleOneMinuteNotification();

//   // Initialize Notification Plugin
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   const InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//   // Schedule Daily Notification
//   await scheduleDailyFactNotification();

//   final categoryProvider = CategoryPreferenceProvider();
//   await categoryProvider.loadPreferences(categoryProvider.allCategories);

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ThemeProvider()),
//         ChangeNotifierProvider(create: (_) => FontSizeProvider()),
//         ChangeNotifierProvider(create: (_) => CategoryPreferenceProvider()),
//       ],
//       child: const MainApp(),
//     ),
//   );
// }

// // Future<void> scheduleDailyFactNotification() async {
// //   final random = Random();
// //   final fact = allFacts[random.nextInt(allFacts.length)];

// //   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
// //     'daily_fact_channel',
// //     'Daily Fact Notifications',
// //     channelDescription: 'Receive a random fact every day',
// //     importance: Importance.high,
// //     priority: Priority.high,
// //   );

// //   const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

// //   await flutterLocalNotificationsPlugin.zonedSchedule(
// //     0,
// //     'Daily Fact',
// //     fact.text,
// //     _nextInstanceOf9AM(),
// //     platformDetails,
// //     androidAllowWhileIdle: true,
// //     uiLocalNotificationDateInterpretation:
// //         UILocalNotificationDateInterpretation.absoluteTime,
// //     matchDateTimeComponents: DateTimeComponents.time,
// //   );
// // }

// // tz.TZDateTime _nextInstanceOf9AM() {
// //   final now = tz.TZDateTime.now(tz.local);
// //   var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 9);
// //   if (scheduledDate.isBefore(now)) {
// //     scheduledDate = scheduledDate.add(const Duration(days: 1));
// //   }
// //   return scheduledDate;
// // }

// Future<void> scheduleDailyFactNotification() async {
//   final random = Random();
//   final fact = allFacts[random.nextInt(allFacts.length)];

//   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//     'daily_fact_channel',
//     'Daily Fact Notifications',
//     channelDescription: 'Receive a random fact every day',
//     importance: Importance.high,
//     priority: Priority.high,
//   );

//   const NotificationDetails platformDetails = NotificationDetails(
//     android: androidDetails,
//   );

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     0,
//     'Daily Fact',
//     fact.text,
//     _nextInstanceOf1MinuteLater(),
//     platformDetails,
//     androidAllowWhileIdle: true,
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//     matchDateTimeComponents: DateTimeComponents.time,
//   );
// }

// tz.TZDateTime _nextInstanceOf1MinuteLater() {
//   final now = tz.TZDateTime.now(tz.local);
//   return now.add(const Duration(minutes: 1));
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp(
//       title: 'Facts App',
//       themeMode: themeProvider.value,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: FutureBuilder<bool>(
//         future: _checkOnboardingStatus(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           } else {
//             final seenOnboarding = snapshot.data ?? false;
//             return seenOnboarding ? const SplashScreen() : const OnboardingScreen();
//           }
//         },
//       ),
//     );
//   }
// }

// Future<bool> _checkOnboardingStatus() async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getBool('onboarding_complete') ?? false;
// }



import 'package:facts_app/data/facts_data.dart';
import 'package:facts_app/provider/category_preference_provider.dart';
import 'package:facts_app/screens/splash_screen.dart';
import 'package:facts_app/provider/theme_provider.dart';
import 'package:facts_app/provider/font_size_provider.dart';
import 'package:facts_app/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:facts_app/screens/onboarding_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await loadFacts();
  NotificationService.initialize();

  // Only initialize notifications; scheduling happens in the app after load
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<bool> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_complete') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FontSizeProvider()),
        ChangeNotifierProvider(create: (_) => CategoryPreferenceProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Facts App',
            themeMode: themeProvider.value,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: FutureBuilder<bool>(
              future: _checkOnboardingStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  final seenOnboarding = snapshot.data ?? false;

                  // Optional: Schedule notifications once app loads fully
                  scheduleDailyFactNotification();
                  NotificationService.scheduleOneMinuteNotification();

                  // Optional: Load user preferences
                  final categoryProvider = Provider.of<CategoryPreferenceProvider>(context, listen: false);
                  categoryProvider.loadPreferences(categoryProvider.allCategories);

                  return seenOnboarding
                      ? const SplashScreen()
                      : const OnboardingScreen();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

Future<void> scheduleDailyFactNotification() async {
  final random = Random();
  final fact = allFacts[random.nextInt(allFacts.length)];

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'daily_fact_channel',
    'Daily Fact Notifications',
    channelDescription: 'Receive a random fact every day',
    importance: Importance.high,
    priority: Priority.high,
  );

  const NotificationDetails platformDetails = NotificationDetails(
    android: androidDetails,
  );

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Daily Fact',
    fact.text,
    _nextInstanceOf1MinuteLater(),
    platformDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}

tz.TZDateTime _nextInstanceOf1MinuteLater() {
  final now = tz.TZDateTime.now(tz.local);
  return now.add(const Duration(minutes: 1));
}



// import 'package:facts_app/data/facts_data.dart';
// import 'package:facts_app/provider/category_preference_provider.dart';
// import 'package:facts_app/screens/splash_screen.dart';
// import 'package:facts_app/provider/theme_provider.dart';
// import 'package:facts_app/provider/font_size_provider.dart';
// //import 'package:facts_app/services/notification_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:math';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   tz.initializeTimeZones();
//   await loadFacts();

//   // Initialize Notification Plugin
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   const InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//   // Request permissions on Android 13+
//   // await flutterLocalNotificationsPlugin
//   //     .resolvePlatformSpecificImplementation<
//   //         AndroidFlutterLocalNotificationsPlugin>()
//   //     ?.requestPermission();
// //   final androidPlugin = flutterLocalNotificationsPlugin
// //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

// // if (androidPlugin != null) {
// //   await androidPlugin.requestPermission();
// // }

//   // Schedule Notification after 1 minute
//   await scheduleDailyFactNotification();

//   final categoryProvider = CategoryPreferenceProvider();
//   await categoryProvider.loadPreferences(categoryProvider.allCategories);

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ThemeProvider()),
//         ChangeNotifierProvider(create: (_) => FontSizeProvider()),
//         ChangeNotifierProvider(create: (_) => CategoryPreferenceProvider()),
//       ],
//       child: const MainApp(),
//     ),
//   );
// }

// Future<void> scheduleDailyFactNotification() async {
//   final random = Random();
//   final fact = allFacts[random.nextInt(allFacts.length)];

//   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//     'daily_fact_channel',
//     'Daily Fact Notifications',
//     channelDescription: 'Receive a random fact every day',
//     importance: Importance.high,
//     priority: Priority.high,
//   );

//   const NotificationDetails platformDetails = NotificationDetails(
//     android: androidDetails,
//   );

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     0,
//     'Daily Fact',
//     fact.text,
//     _nextInstanceOf1MinuteLater(),
//     platformDetails,
//     androidAllowWhileIdle: true,
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//     matchDateTimeComponents: DateTimeComponents.time,
//   );
// }

// tz.TZDateTime _nextInstanceOf1MinuteLater() {
//   final now = tz.TZDateTime.now(tz.local);
//   return now.add(const Duration(minutes: 1));
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp(
//       title: 'Facts App',
//       themeMode: themeProvider.value,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//     );
//   }
// }