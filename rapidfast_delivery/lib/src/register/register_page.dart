import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rapidfast_delivery/src/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            _circleLogin(),
            _iconBack(),
            _textLogin(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _lottieanimation(),
                  _txtFiledEmail(
                    "Correo Electronico",
                    Icon(
                      Icons.mail,
                      color: MyColors.primaryColor,
                    ),
                  ),
                  _txtFiledEmail(
                    "Nombre",
                    Icon(
                      Icons.person,
                      color: MyColors.primaryColor,
                    ),
                  ),
                  _txtFiledEmail(
                    "Apellido",
                    Icon(
                      Icons.person_outline,
                      color: MyColors.primaryColor,
                    ),
                  ),
                  _txtFiledEmail(
                    "Telefono",
                    Icon(
                      Icons.phone,
                      color: MyColors.primaryColor,
                    ),
                  ),
                  _txtFiledEmail(
                    "Contraseña",
                    Icon(Icons.lock, color: MyColors.primaryColor),
                  ),
                  _txtFiledEmail(
                    "Repetir Contraseña",
                    Icon(Icons.lock_outline, color: MyColors.primaryColor),
                  ),
                  _btnLogin(),
                  _txtNotienesCuente()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _txtFiledEmail(String text, Icon icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.prymaryOpacity,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          prefixIcon: icon,
        ),
      ),
    );
  }

  Widget _btnLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "REGISTRARME",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 15)),
      ),
    );
  }

  Widget _txtNotienesCuente() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "¿Ya tienes cuenta?",
            style: TextStyle(color: MyColors.primaryColor),
          ),
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Iniciar Sesion",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MyColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleLogin() {
    return Positioned(
      top: -80,
      left: -90,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: MyColors.primaryColor),
      ),
    );
  }

  Widget _textLogin() {
    return Positioned(
      top: 74,
      left: 26,
      child: Text("REGISTRO",
          style: TextStyle(
              color: MyColors.white,
              fontSize: 20,
              fontFamily: 'NimbusSans',
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _iconBack() {
    return Positioned(
      top: 60,
      left: -5,
      child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyColors.white),
          onPressed: () {}),
    );
  }

  Widget _lottieanimation() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
          bottom: MediaQuery.of(context).size.height * 0.02),
      child: Lottie.asset('assets/json/register.json',
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.25,
          fit: BoxFit.fill),
    );
  }
}
