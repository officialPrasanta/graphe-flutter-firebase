import 'package:flutter/material.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';

Widget primaryButton(
    {required BuildContext context,
    required String labelText,
    void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(5),
        color: kPrimaryButtonColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labelText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    ),
  );
}
