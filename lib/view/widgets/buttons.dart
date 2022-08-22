import 'package:flutter/material.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';

Widget primaryButton(
    {required BuildContext context,
    required String labelText,
    void Function()? onTap,
    double? borderRadius,
    String? prefixImagePath}) {
  return InkWell(
    onTap: onTap,
    child: Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(borderRadius ?? 5),
        color: kPrimaryButtonColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixImagePath != null
              ? ClipOval(
                  child: Image.asset(prefixImagePath),
                )
              : const SizedBox(),
          Text(
            labelText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    ),
  );
}
