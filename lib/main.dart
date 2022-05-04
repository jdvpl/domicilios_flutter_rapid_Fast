import 'package:flutter/material.dart';
import 'package:rapidfast_delivery/src/pages/client/products/list/client_products_list_page.dart';
import 'package:rapidfast_delivery/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:rapidfast_delivery/src/pages/login/login_page.dart';
import 'package:rapidfast_delivery/src/pages/register/register_page.dart';
import 'package:rapidfast_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:rapidfast_delivery/src/pages/roles/roles_page.dart';
import 'package:rapidfast_delivery/src/utils/my_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Rapid fast',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'roles': (BuildContext context) => RolesPage(),
        'client/products/list': (BuildContext context) =>
            CLientProductListPage(),
        'restaurant/order/list': (BuildContext context) =>
            RestaurantOrdersListPage(),
        'delivery/order/list': (BuildContext context) =>
            DeliveryOrdersListPage(),
      },
      theme: ThemeData(
        primaryColor: MyColors.primaryColor,
      ),
    );
  }
}
