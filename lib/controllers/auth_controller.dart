import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphe_firebase_notification/constants/dateformat.dart';
import 'package:graphe_firebase_notification/model/usermodel.dart';

import '../constants/collections.dart';

class AuthController extends GetxController {
  DateTime now = DateTime.now();
  Rx<String> selectedDOB = ''.obs;
  DateTime? pickedDate;

  List<String> genderList = ['Male', 'Female', 'Others'];
  Rx<String> currentGender = 'Male'.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Rx<UserData> userData = UserData().obs;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  UserCredential? _authResult;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //methods

  @override
  void onInit() {
    String displayName = auth.currentUser!.displayName ?? '';
    nameController = TextEditingController(text: displayName);
    super.onInit();
  }

  //login with gmail

  Future loginSignUp() async {
    await EasyLoading.show(status: "Loading...");
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      _authResult = await auth.signInWithCredential(credential);
      if (_authResult != null) {
        if (_authResult!.additionalUserInfo!.isNewUser) {
          EasyLoading.dismiss();
          //create the user
          createTheUser();
        } else {
          EasyLoading.dismiss();
          Get.offNamed("ROOT");
        }
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  void createTheUser() async {
    Timestamp now = Timestamp.now();
    await firestore.collection(USER).doc(auth.currentUser!.uid).set(
      {
        'uid': auth.currentUser!.uid,
        'createdAt': now,
      },
      SetOptions(merge: true),
    );

    userData.update((val) {
      val!.uid = auth.currentUser!.uid;
      val.createdAt = now;
    });
    Get.offAllNamed("REGISTER_USER");
  }

  //fetch user data if user already exists
  Future<UserData?> fetchUserData() async {
    // Map<String, dynamic> userDetailsInJson = await firestore
    //     .collection(USER)
    //     .doc(auth.currentUser!.uid)
    //     .get() as Map<String, dynamic>;

    // return UserData.fromJson(userDetailsInJson);

    DocumentSnapshot<Map<String, dynamic>> data =
        await firestore.collection(USER).doc(auth.currentUser!.uid).get();

    return UserData.fromJson(data.data()!);
  }

  //date picker
  void openDatePicker(BuildContext context) async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (pickedDate != null && pickedDate!.isBefore(now)) {
      if ((now.difference(pickedDate!)..inDays) > const Duration(days: 6574)) {
        selectedDOB.value = ddMMYYYYFormat.format(pickedDate!);
      } else {
        Fluttertoast.showToast(msg: 'You must be 18 years old');
      }
    }
  }

  //Gender dropdown
  void onGenderChange(String? newGender) {
    currentGender.value = newGender!;
  }

  //submit user data - update user
  void updateUser() async {
    String name = nameController.text;
    String phone = phoneController.text;
    await firestore.collection(USER).doc(auth.currentUser!.uid).set(
      {
        'name': name,
        'phone': phone,
        'email': auth.currentUser!.email,
        'gender': currentGender.value,
        'dob': Timestamp.fromDate(ddMMYYYYFormat.parse(selectedDOB.value))
      },
      SetOptions(merge: true),
    );
    Get.offNamed('HOME');
    clearFields();
  }

  //clear the fields
  void clearFields() {
    nameController.clear();
    phoneController.clear();
    selectedDOB.value = '';
    currentGender.value = 'Male';
  }
}
