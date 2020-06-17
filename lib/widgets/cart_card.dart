import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Container(
              height: 75,
              width: 45,
              margin: EdgeInsets.only(left: 13),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width:2, color: Colors.grey)
              ),
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  InkWell(onTap: () {},child: Icon(Icons.keyboard_arrow_up, color: Colors.grey,)),
                  Text('0', style: TextStyle(fontSize: 20),),
                  InkWell(onTap: () {},child: Icon(Icons.keyboard_arrow_down, color: Colors.grey,))
                ]
              ),),
              SizedBox(width: 25),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: AssetImage('assets/images/cupcake.jpg'),
                    fit: BoxFit.cover
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(0, 5)
                      )
                    ]
                    )
              ),
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text('Cupcake', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5),
                  Text('3.0', style: TextStyle(color: Colors.orangeAccent, fontSize: 15),),
                  SizedBox(height: 5,),
                  Container(
                    height: 30,
                    width: 120,
                    margin: EdgeInsets.only(right: 10),
                    child: ListView(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Text('Frozen Cake', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                            SizedBox(width: 5),
                            InkWell(onTap: () {},child: Text('x', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),))
                      ],),
                                        ] 
                    ),
                  )
                ]
              ),
              Spacer(),
              InkWell(onTap: (){},child: Icon(Icons.cancel, color: Colors.grey,))
          ],
          
        ),
      ),
    );
  }
}