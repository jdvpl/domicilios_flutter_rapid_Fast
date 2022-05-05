import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rapidfast_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:rapidfast_delivery/src/utils/my_colors.dart';
import 'package:rapidfast_delivery/src/utils/responsive.dart';

class CLientProductListPage extends StatefulWidget {
  CLientProductListPage({Key key}) : super(key: key);

  @override
  _CLientProductListPageState createState() => _CLientProductListPageState();
}

class _CLientProductListPageState extends State<CLientProductListPage> {
  ClientProductListController _con = new ClientProductListController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        leading: _menuDrawer(responsive.wp(6), responsive.hp(6)),
      ),
      drawer: _drawer(responsive.dp(1.5), responsive.hp(7), responsive.hp(1.5)),
      body: Center(
        child: ElevatedButton(onPressed: _con.logout, child: Text("Salir")),
      ),
    );
  }

  Widget _menuDrawer(double x, double y) {
    return GestureDetector(
      onTap: _con.openDrawer,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Image.asset("assets/img/menu.png", width: x, height: y),
      ),
    );
  }

  Widget _drawer(double fontSize, double heightImage, double marginTopImage) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "UserName",
                  style: TextStyle(
                      color: MyColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize + 2.7),
                  maxLines: 1,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 1,
                ),
                Text(
                  "Telefono",
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 1,
                ),
                Container(
                  height: heightImage,
                  margin: EdgeInsets.only(top: marginTopImage),
                  child: FadeInImage(
                    image: AssetImage("assets/img/no-image.png"),
                    fit: BoxFit.contain,
                    fadeInDuration: Duration(milliseconds: 50),
                    placeholder: AssetImage("assets/img/no-image.png"),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text("Editar Perfil"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            title: Text("Mis Pedidos"),
            trailing: Icon(Icons.shopping_cart),
          ),
          ListTile(
            onTap: _con.gotoOrderPages,
            title: Text("Seleccionar Rol"),
            trailing: Icon(Icons.person),
          ),
          ListTile(
            onTap: _con.logout,
            title: Text("Cerrar Sesion"),
            trailing: Icon(Icons.power_settings_new_outlined),
          ),
        ],
      ),
    );
  }
}
