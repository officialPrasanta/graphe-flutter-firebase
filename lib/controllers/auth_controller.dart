import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  DateTime? pickedDate;
  void openDatePicker(BuildContext context) async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate!;
    }
  }
}
