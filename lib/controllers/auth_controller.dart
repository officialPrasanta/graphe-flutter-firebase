import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:graphe_firebase_notification/constants/dateformat.dart';

class AuthController extends GetxController {
  DateTime now = DateTime.now();
  Rx<String> selectedDate = ''.obs;
  DateTime? pickedDate;
  void openDatePicker(BuildContext context) async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (pickedDate != null && pickedDate!.isBefore(now)) {
      if ((now.difference(pickedDate!)..inDays) > const Duration(days: 6574)) {
        selectedDate.value = ddMMYYYYFormat.format(pickedDate!);
      } else {
        Fluttertoast.showToast(msg: 'You must be 18 years old');
      }
    }
  }
}
