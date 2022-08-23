// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';
import 'package:graphe_firebase_notification/constants/measurement.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.controller,
    this.ishideText,
    this.keyboardType,
    this.labelText,
    Key? key,
  }) : super(key: key);
  TextEditingController? controller;
  bool? ishideText;
  TextInputType? keyboardType;
  String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.labelSmall,
      controller: controller,
      obscureText: ishideText ?? false,
      // onChanged: loginBloc.changeName,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.labelSmall,
        contentPadding: const EdgeInsets.symmetric(
          vertical: kTextFieldPadding,
          horizontal: 16,
        ),
        isDense: true,
        label: Text(labelText ?? 'label'),
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kBorderColor),
        ),
      ),
    );
  }
}
