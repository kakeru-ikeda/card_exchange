import 'package:card_exchange/model/authentication/auth_user.dart';
import 'package:card_exchange/page/authentication/auth_gate.dart';
import 'package:card_exchange/page/introduction/introduction_page.dart';
import 'package:card_exchange/page/navigation_bar/navigation_bar_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool _isFirstLoad = prefs.getBool('isFirstLoad') ?? true;

  AuthUser.user = FirebaseAuth.instance.currentUser;

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MyApp(
    loadState: _isFirstLoad,
  ));

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.loadState});
  final bool loadState;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: loadState ? IntroductionPage() : AuthGate(),
    );
  }
}
