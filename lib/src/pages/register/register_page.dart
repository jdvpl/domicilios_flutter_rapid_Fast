import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:rapidfast_delivery/src/pages/register/register_controller.dart';
import 'package:rapidfast_delivery/src/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _con = new RegisterController();

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
            _iconBack(),
            _textLogin(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageUser(),
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
                        "Nombre",
                        Icon(
                          Icons.person,
                          color: MyColors.primaryColor,
                        ),
                        TextInputType.text,
                        _con.namecontroller,
                        false),
                    _txtFiledEmail(
                        "Apellido",
                        Icon(
                          Icons.person_outline,
                          color: MyColors.primaryColor,
                        ),
                        TextInputType.text,
                        _con.lastnamecontroller,
                        false),
                    _txtFiledEmail(
                        "Telefono",
                        Icon(
                          Icons.phone,
                          color: MyColors.primaryColor,
                        ),
                        TextInputType.phone,
                        _con.phonecontroller,
                        false),
                    _txtFiledEmail(
                        "Contraseña",
                        Icon(Icons.lock, color: MyColors.primaryColor),
                        TextInputType.text,
                        _con.passwordcontroller,
                        true),
                    _txtFiledEmail(
                      "Repetir Contraseña",
                      Icon(Icons.lock_outline, color: MyColors.primaryColor),
                      TextInputType.text,
                      _con.confirmpasswordcontroller,
                      true,
                    ),
                    _btnLogin(),
                    _txtNotienesCuente()
                  ],
                ),
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
        onPressed: _con.register,
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
            onTap: _con.back,
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
      child: GestureDetector(
        onTap: _con.back,
        child: Text("REGISTRO",
            style: TextStyle(
                color: MyColors.white,
                fontSize: 20,
                fontFamily: 'NimbusSans',
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _iconBack() {
    return Positioned(
      top: 60,
      left: -5,
      child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyColors.white),
          onPressed: _con.back),
    );
  }

  Widget _imageUser() {
    return CircleAvatar(
        backgroundImage: AssetImage("assets/img/user_profile_2.png"),
        radius: 60,
        backgroundColor: Colors.grey[200]);
  }
}
