import 'package:flutter/material.dart';
import '../model/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/MyOrders_food.dart';
class OrdersPage extends StatefulWidget {
  static const routeName = '/orders';
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders', style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx , i) {
            return MyOrders(orderData.orders[i]);
          }
          )
      ),
    );
  }
}