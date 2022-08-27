// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:graphe_firebase_notification/config/instance_binding.dart';
import 'package:graphe_firebase_notification/firebase_options.dart';
import 'package:graphe_firebase_notification/routes/routers.dart';
import 'package:graphe_firebase_notification/theme/theme_data.dart';

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
      theme: themeData,
      builder: EasyLoading.init(),
      initialBinding: InstanceBinding(),
      getPages: router,
      initialRoute: 'ROOT',
    );
  }
}
