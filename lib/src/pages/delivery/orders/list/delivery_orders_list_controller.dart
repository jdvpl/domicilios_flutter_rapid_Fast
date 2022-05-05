import 'package:flutter/material.dart';
import 'package:rapidfast_delivery/src/providers/users_providers.dart';
import 'package:rapidfast_delivery/src/utils/shared_pref.dart';

class DeliveryOrdersListController {
  BuildContext context;

  UsersProviders usersProviders = new UsersProviders();

  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProviders.init(context);
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void logout() {
    _sharedPref.logout(context);
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }

  void gotoOrderPages() {
    Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
  }
}
