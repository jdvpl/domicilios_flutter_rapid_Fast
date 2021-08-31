import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rapidfast_delivery/src/pages/client/products/list/client_products_list_controller.dart';

class CLientProductListPage extends StatefulWidget {
  CLientProductListPage({Key key}) : super(key: key);

  @override
  _CLientProductListPageState createState() => _CLientProductListPageState();
}

class _CLientProductListPageState extends State<CLientProductListPage> {
  ClientProductListController _con = new ClientProductListController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: _con.logout, child: Text("Salir")),
      ),
    );
  }
}
