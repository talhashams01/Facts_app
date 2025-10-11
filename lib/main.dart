
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


