import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphe_firebase_notification/constants/measurement.dart';
import 'package:graphe_firebase_notification/controllers/auth_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Home',
        style: Theme.of(context).textTheme.titleSmall,
      )),
      body: Container(
        margin: const EdgeInsets.all(kMargin),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Hi, ${ac.userData.value.fullName?.split(' ')[0] ?? 'visitors'}!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
