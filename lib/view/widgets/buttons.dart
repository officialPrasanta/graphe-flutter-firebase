import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';
import 'package:graphe_firebase_notification/constants/measurement.dart';
import 'package:graphe_firebase_notification/view/widgets/dividers.dart';

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
      padding: const EdgeInsets.symmetric(
        vertical: kTextFieldPadding - 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixImagePath != null
              ? Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        prefixImagePath,
                        width: 32,
                        height: 32,
                      ),
                    ),
                    rowDivider()
                  ],
                )
              : const SizedBox(),
          Text(
            labelText,
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: kButtonTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dobButton({
  required BuildContext context,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(10),
    child: Ink(
      padding: const EdgeInsets.symmetric(
        vertical: kTextFieldPadding,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: kBorderColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Text(
            'Enter Your DOB',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ),
  );
}
