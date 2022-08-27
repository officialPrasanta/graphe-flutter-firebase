import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';
import 'package:graphe_firebase_notification/constants/measurement.dart';
import 'package:graphe_firebase_notification/theme/material_colors.dart';
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
        borderRadius: BorderRadiusDirectional.circular(borderRadius ?? 0),
        color: kPrimaryMaterialColor,
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
  required selectedDOB,
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
            selectedDOB == '' ? 'Enter Your DOB' : selectedDOB,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ),
  );
}

Widget dropDown(
    {required List<String> itemList,
    required BuildContext context,
    required String currentItem,
    void Function(String?)? onChange}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: kTextFieldPadding - 2,
      horizontal: 16,
    ),
    decoration: BoxDecoration(
        border: Border.all(
          color: kBorderColor,
        ),
        borderRadius: BorderRadius.circular(10)),
    child: DropdownButton<String>(
      value: currentItem,
      items: itemList
          .map(
            (String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: onChange,
      iconSize: 0.0,
      underline: const SizedBox(),
      isExpanded: true,
      isDense: true,
      style: Theme.of(context).textTheme.labelSmall,
    ),
  );
}
