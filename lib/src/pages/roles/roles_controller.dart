import 'package:flutter/material.dart';
import 'package:rapidfast_delivery/src/models/user.dart';
import 'package:rapidfast_delivery/src/utils/shared_pref.dart';

class RolesController {
  BuildContext context;
  User user;
  SharedPref sharedPref = new SharedPref();
  Function refresh;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    // obteniendo el usuario de session
    user = User.fromJson(await sharedPref.read('user'));
    refresh();
  }

  void gotToPage(String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
