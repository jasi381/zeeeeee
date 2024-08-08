import 'package:flutter/material.dart';
import 'package:zeeeeee/screens/login.dart';
import 'package:zeeeeee/services/firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.setupFirebase();
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const Login(),
    );
  }
}
