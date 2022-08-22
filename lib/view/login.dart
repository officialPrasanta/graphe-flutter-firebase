import 'package:flutter/material.dart';
import 'package:graphe_firebase_notification/view/widgets/buttons.dart';
import 'package:graphe_firebase_notification/view/widgets/custom_text_field.dart';
import 'package:graphe_firebase_notification/view/widgets/dividers.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
                labelText: 'Enter Your Email',
                keyboardType: TextInputType.emailAddress),
            TextFieldDivider(),
            CustomTextField(
              labelText: 'Enter Your Password',
              ishideText: true,
            ),
            TextFieldDivider(),
            primaryButton(
              context: context,
              labelText: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
