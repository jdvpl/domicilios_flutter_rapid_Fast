import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rapidfast_delivery/src/models/repose_api.dart';
import 'package:rapidfast_delivery/src/models/user.dart';
import 'package:rapidfast_delivery/src/providers/users_providers.dart';
import 'package:rapidfast_delivery/src/utils/shared_pref.dart';
import 'package:rapidfast_delivery/src/utils/snackbar.dart';

class LoginController {
  BuildContext context;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  UsersProviders usersProviders = new UsersProviders();

  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProviders.init(context);
    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    print("Usuario ${user?.toJson()}");

    if (user?.sessionToken != null) {
      if (user.roles.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, user.roles[0].route, (route) => false);
      }
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    bool isValid = EmailValidator.validate(email);

    if (!isValid) {
      Snackbar.showSnackbar(context, "correo invalido");
    }
    if (email.isEmpty || password.isEmpty) {
      Snackbar.showSnackbar(context, "Ingresar todos los campos.");
    }
    ResponseApi responseApi = await usersProviders.login(email, password);

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      print("data: ${user.toJson()}");
      _sharedPref.save("user", user.toJson());

      print("Usuario log ${user.toJson()}");
      if (user.roles.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, user.roles[0].route, (route) => false);
      }
    } else {
      Snackbar.showSnackbar(context, responseApi.message);
    }
  }
}
