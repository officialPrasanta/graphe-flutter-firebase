import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphe_firebase_notification/constants/measurement.dart';
import 'package:graphe_firebase_notification/controllers/auth_controller.dart';
import 'package:graphe_firebase_notification/view/widgets/buttons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.find<AuthController>();
    return Scaffold(
      bottomNavigationBar: primaryButton(
        context: context,
        labelText: 'All Notification',
      ),
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(kMargin),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Hi, ${ac.userData.value.fullName?.split(' ')[0] ?? 'visitors'}!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
