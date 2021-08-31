import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginController {
  BuildContext context;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  Future init(BuildContext context) {
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login() {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    bool isValid = EmailValidator.validate(email);
    print("Credenciales $email y $password");
    print('Email is valid? ' + (isValid ? 'yes' : 'no'));
  }
}
