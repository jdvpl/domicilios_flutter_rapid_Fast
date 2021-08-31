import 'package:flutter/material.dart';
import 'package:rapidfast_delivery/src/utils/my_colors.dart';

class Snackbar {
  static void showSnackbar(BuildContext context, String text) {
    if (context == null) return;

    FocusScope.of(context).requestFocus(new FocusNode());

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: MyColors.white, fontSize: 14),
        ),
        backgroundColor: MyColors.primaryColor,
        duration: Duration(seconds: 4)));
  }
}
