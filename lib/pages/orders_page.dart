import 'package:flutter/material.dart';
import '../widgets/cart_card.dart';
import '../pages/sign_in_page.dart';
import 'package:provider/provider.dart';
import '../model/cart.dart';
class OrderPage extends StatefulWidget {
 
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text('Your Food Cart', style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
          body: Container(
          child: ListView.builder(
            itemCount: cart.items.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, i) => CartCard(cart.items.values.toList()[i].quantity, cart.items.values.toList()[i].price, cart.items.values.toList()[i].title, cart.items.values.toList()[i].id),
              // CartCard(),
              // CartCard(),
            
          ),
        
      ),
      bottomNavigationBar: Container(
                padding: EdgeInsets.all(12),
                height: 220,
                child: Column(
                  children: <Widget>[
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Cart Total', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                      Text('${cart.total.toString()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],),
                  
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Discount',style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                      Text('3.0',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Tax',style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                      Text('0.5',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],),
                  SizedBox(height: 5),
                  Divider(height: 20,color: Colors.grey,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Sub Total',style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                      Text(cart.subTotal.toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(25)
                      ),
                    child: GestureDetector(
                      onTap: (){ 
                        Navigator.of(context).pushNamed(SignIn.routeName);
                    },
                    child: Text('Proceed to Checkout', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
                  )
                  ],    
                         
                ),
              
              ),
    );
  }
}