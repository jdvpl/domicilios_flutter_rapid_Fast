import 'package:flutter/material.dart';
import 'package:rapidfast_delivery/src/models/user.dart';
import 'package:rapidfast_delivery/src/providers/users_providers.dart';
import 'package:rapidfast_delivery/src/utils/shared_pref.dart';

class RestaurantOrdersListController {
  BuildContext context;

  UsersProviders usersProviders = new UsersProviders();

  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  User user;
  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    await usersProviders.init(context);
    user = User.fromJson(await _sharedPref.read('user'));

    refresh();
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
