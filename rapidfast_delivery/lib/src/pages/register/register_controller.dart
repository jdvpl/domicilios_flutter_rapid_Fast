import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rapidfast_delivery/src/models/repose_api.dart';
import 'package:rapidfast_delivery/src/models/user.dart';
import 'package:rapidfast_delivery/src/providers/users_providers.dart';

class RegisterController {
  BuildContext context;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController confirmpasswordcontroller = new TextEditingController();

  // provider
  UsersProviders usersProviders = new UsersProviders();
  Future init(BuildContext context) {
    this.context = context;
    // se coloca el metodo init porque alla ya tiene el constructor
    usersProviders.init(context);
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void register() async {
    String email = emailcontroller.text.trim();
    String name = namecontroller.text.trim();
    String lastname = lastnamecontroller.text.trim();
    String phone = phonecontroller.text.trim();
    String password = passwordcontroller.text.trim();
    String confirmpassword = confirmpasswordcontroller.text.trim();
    bool isValid = EmailValidator.validate(email);

    User user = new User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: password,
    );
    ResponseApi resposeApi = await usersProviders.create(user);
    print("RESPUESTA: ${resposeApi.toJson()}");

    print(
        "Credenciales $email \n$name \n$lastname \n$phone  \n$password \n$confirmpassword");
    print('Email is valid? ' + (isValid ? 'yes' : 'no'));
  }
}
