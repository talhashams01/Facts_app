
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