import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance ;
  void requestNotificationPermissions() async{
    NotificationSettings  settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      provisional: true,
      carPlay: true,
      badge: true,
      sound: true,
      criticalAlert: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('User granted permissions');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('User granted provisional permissions');
    }else{
      print('User denied permissions');
    }
  }
  Future<String> getDeviceToken() async{
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async{
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }
  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {
      if(kDebugMode){
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }
      showNotification(message);
    });
  }
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  void initLocalNotifications(BuildContext context, RemoteMessage message) async{
    var androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload){

      }
    );
  }
  Future<void> showNotification(RemoteMessage message) async{
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        "High Importance Notification",
    importance: Importance.max);
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        channel.id.toString(),
       channel.name.toString(),
    channelDescription: 'Your channel description',
    importance: Importance.high,
    priority: Priority.high,
    ticker: 'ticker');
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );
    Future.delayed(Duration.zero,(){
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    }
    );
  }
}

//device token(adiba) :    dFgqpGCNTcq70Iyfcqb2S-:APA91bGWVQgbeinrgUTyHrc66NHBE7-tnfQkn2o0UGAxJDN8kwDsqAvmNaA7BKkVNEmCQa1Q0RK8FsOs5gF6m75Wuxb7bs4pMQQ0IXB3Z7whqj1f-miCAzwbVpMMd7c9rX1i2YgZj7Fk