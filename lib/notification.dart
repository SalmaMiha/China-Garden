import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'local_notification.dart';

class Notification_Page extends StatefulWidget {
  const Notification_Page({Key? key}) : super(key: key);

  @override
  _Notification_PageState createState() => _Notification_PageState();
}

class _Notification_PageState extends State<Notification_Page> {

  String notificationMsg = "Waiting for notifications ";
  @override
  void initState(){
    super.initState();

    LocalNotificationService.initilize();

    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null){
        setState(() {
          notificationMsg = "${event.notification!.title} ${event.notification!.body}";
        });
      }
    });
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnForeground(event);
      setState(() {
        notificationMsg = "${event.notification!.title} ${event.notification!.body}";
      });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg = "${event.notification!.title} ${event.notification!.body}";
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF4500),
        title: Text('Notifications',
        style: TextStyle(
          fontSize: 25
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          color: Color(0x77FF4500),
          child: Center(
            child: Text(
              notificationMsg,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
