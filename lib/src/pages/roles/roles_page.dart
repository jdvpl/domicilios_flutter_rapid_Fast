import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rapidfast_delivery/src/models/rol.dart';
import 'package:rapidfast_delivery/src/pages/roles/roles_controller.dart';
import 'package:rapidfast_delivery/src/utils/responsive.dart';

class RolesPage extends StatefulWidget {
  RolesPage({Key key}) : super(key: key);

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  RolesController _con = new RolesController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecciona un rol"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          margin: EdgeInsets.only(top: responsive.hp(10)),
          child: ListView(
            children: _con.user != null
                ? _con.user.roles.map((Rol rol) {
                    return _cardRol(
                      rol,
                      responsive.hp(15),
                      responsive.dp(2),
                      responsive.hp(3),
                    );
                  }).toList()
                : [],
          ),
        ),
      ),
    );
  }

  Widget _cardRol(
    Rol rol,
    double heightImage,
    double fontSize,
    double heightSized,
  ) {
    return GestureDetector(
      onTap: () {
        _con.gotToPage(rol.route);
      },
      child: Column(
        children: [
          Container(
            height: heightImage,
            child: FadeInImage(
              image: rol.image != null
                  ? NetworkImage(rol.image)
                  : AssetImage("assets/img/no-image.png"),
              fit: BoxFit.contain,
              fadeInDuration: Duration(milliseconds: 50),
              placeholder: AssetImage("assets/img/no-image.png"),
            ),
          ),
          SizedBox(height: heightSized),
          Text(
            rol.name ?? '',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
            ),
          ),
          SizedBox(height: heightSized),
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
