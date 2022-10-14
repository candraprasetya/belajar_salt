part of 'services.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotif =
      FlutterLocalNotificationsPlugin();

  void init(
      Future<dynamic> Function(int, String?, String?, String?)? onDidReceive) {
    final AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings(appIcon);

    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceive,
    );

    final InitializationSettings initSetting =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    initLocalNotif(initSetting);
  }

  void initLocalNotif(InitializationSettings initSetting) async {
    await localNotif.initialize(initSetting);
  }

  void showNotif(String message) async {
    AndroidNotificationDetails androidNotifDetail =
        const AndroidNotificationDetails(channelId, 'Belajar Salt',
            playSound: true);

    // DarwinNotificationDetails iosNotifDetail = DarwinNotificationDetails();

    await localNotif.show(12345, "Hallo", message,
        NotificationDetails(android: androidNotifDetail));
  }

  //TODO: Scheduled Notif Birthday

  //TODO: Cancel Notif

  //TODO: Handle Payload Notif
}
