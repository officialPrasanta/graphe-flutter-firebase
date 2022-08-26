import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphe_firebase_notification/controllers/auth_controller.dart';
import 'package:graphe_firebase_notification/model/usermodel.dart';
import 'package:graphe_firebase_notification/view/home.dart';
import 'package:graphe_firebase_notification/view/login.dart';
import 'package:graphe_firebase_notification/view/register.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.find<AuthController>();
    final User? user = ac.auth.currentUser;
    return user == null
        ? const Login()
        : FutureBuilder<UserData?>(
            future: ac.fetchUserData(),
            builder: (BuildContext context, AsyncSnapshot<UserData?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //dynamic routing
                if (snapshot.hasError) {
                  return const Login();
                } else {
                  ac.userData.value = snapshot.data!;
                  if (ac.userData.value.fullName == null) {
                    return const RegisterUser();
                  }else{
                    return const Home();
                  }
                }
              } else {
                //splash screen
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            });
  }
}
