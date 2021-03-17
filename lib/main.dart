import 'package:fcm_cleanarch_flutter/commons/base_component.dart';
import 'package:fcm_cleanarch_flutter/commons/messaging_manager.dart';
import 'package:fcm_cleanarch_flutter/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MessagingManager manager = MessagingManager();
  getIt.registerSingleton<MessagingManager>(manager);

  await manager.setupFirebase();

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
