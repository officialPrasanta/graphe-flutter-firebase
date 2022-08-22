import 'package:flutter/material.dart';
import 'package:graphe_firebase_notification/view/widgets/buttons.dart';
import 'package:graphe_firebase_notification/view/widgets/custom_text_field.dart';
import 'package:graphe_firebase_notification/view/widgets/dividers.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
                labelText: 'Enter Your Name',
                keyboardType: TextInputType.emailAddress),
            ColumnDivider(),
            CustomTextField(
              labelText: 'Enter Your Phone Number',
              ishideText: true,
              keyboardType: TextInputType.phone,
            ),
            ColumnDivider(),
            primaryButton(
              context: context,
              labelText: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
