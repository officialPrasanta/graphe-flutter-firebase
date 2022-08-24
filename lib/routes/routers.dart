import 'package:get/get.dart';
import 'package:graphe_firebase_notification/service/root.dart';
import 'package:graphe_firebase_notification/view/home.dart';
import 'package:graphe_firebase_notification/view/login.dart';
import 'package:graphe_firebase_notification/view/register.dart';

List<GetPage> router = [
        GetPage(name: '/ROOT', page: () => const Root()),
        GetPage(name: '/LOGIN', page: () => const Login()),
        GetPage(name: '/HOME', page: () => const Home()),
        GetPage(name: '/REGISTER_USER', page: () => const RegisterUser()),
        // GetPage(name: 'SIGNUP', page: ()=>SignUp()),
      ];