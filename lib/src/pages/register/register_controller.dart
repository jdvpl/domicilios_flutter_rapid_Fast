import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rapidfast_delivery/src/models/repose_api.dart';
import 'package:rapidfast_delivery/src/models/user.dart';
import 'package:rapidfast_delivery/src/providers/users_providers.dart';
import 'package:rapidfast_delivery/src/utils/snackbar.dart';

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
  // ignore: missing_return
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

    if (email.isEmpty ||
        name.isEmpty ||
        phone.isEmpty ||
        lastname.isEmpty ||
        password.isEmpty ||
        confirmpassword.isEmpty) {
      Snackbar.showSnackbar(context, "Debes ingresar todos los campos.");
      return;
    }
    if (confirmpassword != password) {
      Snackbar.showSnackbar(context, "Las constraseñas no coinciden.");
      return;
    }
    if (password.length < 6) {
      Snackbar.showSnackbar(
          context, "La constraseñas debe tener al menos 6 caracteres.");
      return;
    }
    if (!isValid) {
      Snackbar.showSnackbar(context, "Correo invalido.");
      return;
    }
    User user = new User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: password,
    );
    print(user.lastname);
    try {
      ResponseApi resposeApi = await usersProviders.create(user);
      Snackbar.showSnackbar(context, resposeApi.message);
      if (resposeApi.success) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
        });
      }
      print(resposeApi.message);
    } catch (e) {
      print("error ${e.message}");
    }
  }

  // volver atras
  void back() {
    Navigator.pop(context);
  }

  void showGalleryDialog() {
    Widget galleryButton = ElevatedButton(
      onPressed: () {},
      child: Text("Galeria"),
    );
    Widget cameraButton = ElevatedButton(
      onPressed: () {},
      child: Text("Camara"),
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona tu foto de perfil'),
      actions: [galleryButton, cameraButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
