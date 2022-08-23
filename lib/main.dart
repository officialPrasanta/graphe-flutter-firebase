// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphe_firebase_notification/config/instance_binding.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';
import 'package:graphe_firebase_notification/firebase_options.dart';
import 'package:graphe_firebase_notification/view/login.dart';
import 'package:graphe_firebase_notification/view/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Firebase Notifications',
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffolBackgroundColor,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.openSans(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 1.2,
            color: kTextColor,
          ),
          titleMedium: GoogleFonts.openSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 1.2,
            color: kLabelColor,
          ),
          bodyMedium: GoogleFonts.openSans(
            fontSize: 14,
            height: 1.2,
            color: kTextColor,
          ),
          bodySmall: GoogleFonts.openSans(
            fontSize: 12,
            color: kTextColor,
          ),
          labelSmall: GoogleFonts.openSans(
            fontSize: 14,
            color: kLabelColor,
          ),
          headlineSmall: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
      ),
      home: RegisterUser(),
      initialBinding: InstanceBinding(),
    );
  }
}
