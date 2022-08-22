import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';
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
      padding: const EdgeInsets.only(top: 12, bottom: 12),
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
