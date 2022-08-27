import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphe_firebase_notification/constants/measurement.dart';
import 'package:graphe_firebase_notification/controllers/auth_controller.dart';
import 'package:graphe_firebase_notification/view/widgets/buttons.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.find<AuthController>();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: kMargin,
          right: kMargin,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Text(
                    'Hello There,',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Welcome back',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: primaryButton(
                  prefixImagePath: "assets/google.png",
                  context: context,
                  labelText: 'Login / Signup With Google',
                  borderRadius: 6,
                  onTap: ac.loginSignUp),
            )
          ],
        ),
      ),
    );
  }
}
