// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';


// class FcmHelper {


//   // Notification lib
//   static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   /// this function will initialize firebase and fcm instance
//   static Future<void> initFcm() async {
//     try {
// _initNotification();
//       // listen to notifications clicks
//       listenToActionButtons();
//     } catch (error) {
//       print(error);
//     }
//   }

//   /// when user click on notification or click on button on the notification
//   static listenToActionButtons() {
//     awesomeNotifications.actionStream.listen(
//       (ReceivedNotification receivedNotification) async {
//         // TODO make ur actions (open screen or sth)
//         // for ex:
//         //Get.toNamed(Routes.NOTIFICATIONS)
//       },
//     );
//   }

 



//   ///handle fcm notification when app is closed/terminated
//   static Future<void> _fcmBackgroundHandler( message) async {
//     showNotification(
//       id: 1,
//       title: 'Tittle',
//       body: 'Body',
//     );
//   }

//   //handle fcm notification when app is open
//   static Future<void> _fcmForegroundHandler( message) async {
//     showNotification(
//       id: 1,
//       title: 'Tittle',
//       body:'Body',
//     );
//   }

//   //display notification for user with sound
//   static showNotification(
//       {required String title,
//       required String body,
//       required int id,
//       String? channelKey,
//       String? groupKey,
//       NotificationLayout? notificationLayout,
//       String? summary,
//       Map<String, String>? payload,
//       String? largeIcon}) async {
//     awesomeNotifications.isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         awesomeNotifications.requestPermissionToSendNotifications();
//       } else {
//         // u can show notification
//         awesomeNotifications.createNotification(
//           content: NotificationContent(
//             id: id,
//             title: title,
//             body: body,
      
//             channelKey: "basic_channel",
//             showWhen: true, // Hide/show the time elapsed since notification was displayed
//             payload: payload, // data of the notification (it will be used when user clicks on notification)
//             notificationLayout: notificationLayout, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
//             autoDismissible: true, // dismiss notification when user clicks on it
//             summary: summary, // for ex: New message (it will be shown on status bar before notificaiton shows up)
//             largeIcon: largeIcon, // image of sender for ex (when someone send you message his image will be shown)
//           ),
//         );
//       }
//     });
//   }

//   ///init notifications channels
//   static _initNotification() async {
//     await awesomeNotifications.initialize(
//         null, // null mean it will show app icon on the notification (status bar)
//         [
//          NotificationChannel(
//         channelGroupKey: 'basic_channel_group',
//         channelKey: 'basic_channel',
//         channelName: 'Basic notifications',
//         channelDescription: 'Notification channel for basic tests',
//         defaultColor: Color(0xFF9D50DD),
//         ledColor: Colors.white)
//         ],
//         );
//   }
// }

