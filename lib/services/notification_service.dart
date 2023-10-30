import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  // fcm token
 static Future<String> getFcmToken() async {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.instance.requestPermission();
    String? fcmToken; // Change here
    await _firebaseMessaging.getToken().then((token) {
      fcmToken = token;
    });
    return fcmToken.toString();
  }
}
