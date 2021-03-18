import 'package:fcm_cleanarch_flutter/commons/base_component.dart';
import 'package:fcm_cleanarch_flutter/commons/messaging_manager.dart';
import 'package:fcm_cleanarch_flutter/ui/screens/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
//  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MessagingManager manager = MessagingManager();
  getIt.registerSingleton<MessagingManager>(manager);

  await manager.setupFirebase(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseComponent(
      child: MaterialApp(
        title: 'FCM CleanArch Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(title: 'FCM CleanArch Flutter'),
      ),
    );
  }
}
