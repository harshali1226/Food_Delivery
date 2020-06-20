import 'package:flutter/material.dart';
import '../model/orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';
class MyOrders extends StatefulWidget {
  final OrderItem order;
  MyOrders(this.order);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget> [
          ListTile(title: Text('${widget.order.price}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(DateFormat('dd/MM/yyyy   hh:mm').format(widget.order.dateTime), style: TextStyle(fontSize: 15,),),
          trailing: IconButton(icon: _expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more), onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          }),
          ),
          if(_expanded) 
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.products.map((prod) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      prod.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                    Text('${prod.quantity}x \$${prod.price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ,)
                  ],
                )).toList()
              ),
              )
        ]
      ),
    );
  }
}