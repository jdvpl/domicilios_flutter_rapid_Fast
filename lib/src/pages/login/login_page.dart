import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:rapidfast_delivery/src/pages/login/login_controller.dart';
import 'package:rapidfast_delivery/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

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
                  _lottieanimation(),
                  _txtFiledEmail(
                      "Correo Electronico",
                      Icon(
                        Icons.mail,
                        color: MyColors.primaryColor,
                      ),
                      TextInputType.emailAddress,
                      _con.emailcontroller,
                      false),
                  _txtFiledEmail(
                      "Contraseña",
                      Icon(Icons.lock, color: MyColors.primaryColor),
                      TextInputType.visiblePassword,
                      _con.passwordcontroller,
                      true),
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

  Widget _txtFiledEmail(String text, Icon icon, TextInputType type,
      TextEditingController controller, bool oscure) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.prymaryOpacity,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: controller,
        keyboardType: type,
        obscureText: oscure,
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
        onPressed: _con.login,
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
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            "Registrate",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor,
                fontSize: 19),
          ),
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
              fontFamily: 'NimbusSans',
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _lottieanimation() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
          bottom: MediaQuery.of(context).size.height * 0.1),
      child: Lottie.asset('assets/json/delivery.json',
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          fit: BoxFit.fill),
    );
  }
}
