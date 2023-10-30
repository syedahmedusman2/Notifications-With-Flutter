import 'package:flutter/material.dart';
import 'package:flutter_notification/firebase_options.dart';
import 'package:flutter_notification/services/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // name: 'Notifications With Flutter',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    NotificationService.initializeLocalNotification();
    // Listining to notifications when app is opened
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
      print("Message AAYA");
      NotificationService.display(message);

    });
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications With Flutter")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()async{
              print(await NotificationService.getFcmToken());
            }, child: Text("Get Fcm Token"))
      
        ]),
      ),
    );
  }
}