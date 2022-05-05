import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rapidfast_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_controller.dart';
import 'package:rapidfast_delivery/src/utils/my_colors.dart';
import 'package:rapidfast_delivery/src/utils/responsive.dart';

class RestaurantOrdersListPage extends StatefulWidget {
  RestaurantOrdersListPage({Key key}) : super(key: key);

  @override
  State<RestaurantOrdersListPage> createState() =>
      _RestaurantOrdersListPageState();
}

class _RestaurantOrdersListPageState extends State<RestaurantOrdersListPage> {
  RestaurantOrdersListController _con = new RestaurantOrdersListController();

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
      key: _con.key,
      appBar: AppBar(
        leading: _menuDrawer(responsive.wp(6), responsive.hp(6)),
      ),
      drawer: _drawer(responsive.dp(1.5), responsive.hp(7), responsive.hp(1.5)),
      body: Center(
        child: Text("Restaurant"),
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
                  '${_con.user?.name ?? ''} ${_con.user?.lastname ?? ''}',
                  style: TextStyle(
                      color: MyColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize + 2.7),
                  maxLines: 1,
                ),
                Text(
                  '${_con.user?.email ?? ''} ',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 1,
                ),
                Text(
                  '${_con.user?.phone ?? ''} ',
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
                    image: _con.user?.image != null
                        ? NetworkImage(_con.user?.image)
                        : AssetImage("assets/img/no-image.png"),
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

  void refresh() {
    setState(() {});
  }
}
