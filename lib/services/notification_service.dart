// import 'dart:math';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import '../data/facts_data.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin(); 

//   static Future<void> scheduleDailyFactNotification() async {
//     final random = Random();
//     final randomFact = allFacts[random.nextInt(allFacts.length)];

//     await _notificationsPlugin.zonedSchedule(
//       0,
//       'Daily Fact',
//       randomFact.text,
//       _nextInstanceOfTenAM(),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'daily_fact_channel',
//           'Daily Fact Notifications',
//           importance: Importance.high,
//           priority: Priority.high,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       payload: randomFact.text,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }

//   static tz.TZDateTime _nextInstanceOfTenAM() {
//     final now = tz.TZDateTime.now(tz.local);
//     final scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
//     return now.isBefore(scheduled)
//         ? scheduled
//         : scheduled.add(const Duration(days: 1));
//   }
// }

// import 'dart:math';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:facts_app/data/facts_data.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> initialize() async {
//     const AndroidInitializationSettings androidInitSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings settings =
//         InitializationSettings(android: androidInitSettings);

//     await _notificationsPlugin.initialize(settings);
//   }

//   static Future<void> scheduleDailyFactNotification() async {
//     final random = Random();
//     final fact = allFacts[random.nextInt(allFacts.length)];

//     const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//       'daily_fact_channel',
//       'Daily Fact Notifications',
//       channelDescription: 'Receive a random fact every day',
//       importance: Importance.high,
//       priority: Priority.high,
//     );

//     const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

//     await _notificationsPlugin.zonedSchedule(
//       0,
//       'Daily Fact',
//       fact.text,
//       _nextInstanceOf9AM(),
//       platformDetails,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }

//   static tz.TZDateTime _nextInstanceOf9AM() {
//     final now = tz.TZDateTime.now(tz.local);
//     final scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, 9);
//     return now.isBefore(scheduled) ? scheduled : scheduled.add(Duration(days: 1));
//   }
// }

// import 'dart:math';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import '../data/facts_data.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> scheduleDailyFactNotification() async {
//     final random = Random();
//     final randomFact = allFacts[random.nextInt(allFacts.length)];

//     await _notificationsPlugin.zonedSchedule(
//       0,
//       'Daily Fact',
//       randomFact.text,
//       _nextInstanceOfTenAM(),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'daily_fact_channel',
//           'Daily Fact Notifications',
//           channelDescription: 'Receive a random fact every day',
//           importance: Importance.high,
//           priority: Priority.high,
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       androidAllowWhileIdle: true,
//       payload: randomFact.text,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }

//   static tz.TZDateTime _nextInstanceOfTenAM() {
//     final now = tz.TZDateTime.now(tz.local);
//     final scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
//     return now.isBefore(scheduled)
//         ? scheduled
//         : scheduled.add(const Duration(days: 1));
//   }

//   static initialize() {}
// }

import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import '../data/facts_data.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> scheduleOneMinuteNotification() async {
    final random = Random();
    final randomFact = allFacts[random.nextInt(allFacts.length)];

    await _notificationsPlugin.zonedSchedule(
      0,
      'Daily Fact',
      randomFact.text,
      _oneMinuteFromNow(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_fact_channel',
          'Daily Fact Notifications',
          channelDescription: 'Receive a random fact every day',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: randomFact.text,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: null, // No repeating pattern
    );
  }

  static tz.TZDateTime _oneMinuteFromNow() {
    final now = tz.TZDateTime.now(tz.local);
    return now.add(const Duration(minutes: 1));
  }

  static void initialize() {
    // Empty if no special setup needed here
  }
}