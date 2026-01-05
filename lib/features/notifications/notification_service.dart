import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeForBackground() async {
    await _initializeLocalNotifications(handleTaps: false);
  }

  static Future<void> initialize() async {
    await _initializeLocalNotifications(handleTaps: true);
    await _requestPermissions();
    _setupForegroundNotifications();
    _setupNotificationTapHandling();
  }

  static Future<void> _initializeLocalNotifications({
    required bool handleTaps,
  }) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: handleTaps
          ? _handleLocalNotificationTap
          : null,
    );
    await _createNotificationChannel();
  }

  static Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
    );

    final androidImplementation = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidImplementation != null) {
      await androidImplementation.createNotificationChannel(channel);
    }
  }

  static Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription:
              'This channel is used for important notifications.',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await _localNotifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: data != null ? jsonEncode(data) : null,
    );
  }

  static Future<void> _requestPermissions() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
  }

  static void _setupForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification == null && message.data.isNotEmpty) {
        final notificationTitle = message.data['notificationTitle'];
        final notificationBody = message.data['notificationBody'];

        if (notificationTitle != null && notificationBody != null) {
          showLocalNotification(
            id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
            title: notificationTitle,
            body: notificationBody,
            data: message.data,
          );
        }
      }
    });
  }

  static void _setupNotificationTapHandling() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationTap(message);
    });

    FirebaseMessaging.instance.getInitialMessage().then((
      RemoteMessage? message,
    ) {
      if (message != null) {
        _handleNotificationTap(message);
      }
    });
  }

  static void _handleNotificationTap(RemoteMessage message) {
    final data = message.data;
    print('Notification tapped with data: $data');
    // TODO: Add navigation logic later
  }

  static void _handleLocalNotificationTap(NotificationResponse response) {
    if (response.payload != null) {
      try {
        final data = jsonDecode(response.payload!) as Map<String, dynamic>;
        print('Local notification tapped with data: $data');
        // TODO: Add navigation logic later
      } catch (e) {
        print('Error parsing notification payload: $e');
      }
    }
  }

  static Future<void> showBackgroundNotification(RemoteMessage message) async {
    final data = message.data;
    await showLocalNotification(
      id: message.hashCode,
      title: data['notificationTitle'] ?? 'New message',
      body: data['notificationBody'] ?? 'You have received a new message',
      data: data,
    );
  }
}
