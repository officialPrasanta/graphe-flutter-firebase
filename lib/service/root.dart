import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphe_firebase_notification/constants/measurement.dart';
import 'package:graphe_firebase_notification/controllers/auth_controller.dart';
import 'package:graphe_firebase_notification/view/widgets/buttons.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.find<AuthController>();
    final User? user = ac.auth.currentUser;
    return user == null
        ? SignUp()
        : FutureBuilder<UserData?>(
            future: ac.fetchUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //dynamic routing
                if (snapshot.hasError) {
                  return Login();
                } else {
                  ac.userData.value = snapshot.data!;
                  if (ac.userData.value.name!.isEmpty) {
                    return UserDetails();
                  }else{
                    return Home();
                  }
                }
              } else {
                //splash screen
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            });
  }
}
