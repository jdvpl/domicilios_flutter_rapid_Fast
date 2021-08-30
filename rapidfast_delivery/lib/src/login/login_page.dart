import 'package:flutter/material.dart';
import 'package:rapidfast_delivery/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            _circleLogin(),
            _textLogin(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _imageBanner(),
                  _txtFiledEmail(
                      "Correo Electronico",
                      Icon(
                        Icons.mail,
                        color: MyColors.primaryColor,
                      )),
                  _txtFiledEmail("Contraseña",
                      Icon(Icons.lock, color: MyColors.primaryColor)),
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

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
          bottom: MediaQuery.of(context).size.height * 0.15),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
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
          "INGRESAR",
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿No tienes cuenta?",
          style: TextStyle(color: MyColors.primaryColor),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Registrate",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: MyColors.primaryColor),
        ),
      ],
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
      top: 80,
      left: 30,
      child: Text("LOGIN",
          style: TextStyle(
              color: MyColors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold)),
    );
  }
}
