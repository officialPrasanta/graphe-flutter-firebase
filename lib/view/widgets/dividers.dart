import 'package:flutter/material.dart';

Widget columnDivider({double? height}) {
  return SizedBox(
    height: height ?? 16,
  );
}

Widget rowDivider({double? width}) {
  return SizedBox(
    width: width ?? 16,
  );
}
