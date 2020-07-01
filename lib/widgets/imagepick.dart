import 'package:flutter/material.dart';
import 'package:food_delivery/pages/userProduct_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import './list.dart';
import '../pages/orders_page.dart';
import '../pages/edit_page.dart';
class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File imageFile;
   // final picker = ImagePicker();
   _openGallery(BuildContext context) async {
      var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(pickedFile.path);
    });
    Navigator.of(context).pop();

    }

     _openCamera(BuildContext context) async {
      var pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      imageFile = File(pickedFile.path);
    });
Navigator.of(context).pop();

    }

    Future<void> _showChoiceDialog(BuildContext context) {
       return showDialog(context: context, builder: (context) 
       {
       return AlertDialog(
         title: Text('Make a choice!'),
         content: SingleChildScrollView(
           child: ListBody(children: <Widget>[
             GestureDetector(
               child: Text('Gallery'),
               onTap: () { 
                 _openGallery(context);
                 },
                 ),
             Padding(padding: EdgeInsets.all(8)),
             GestureDetector(
               child: Text('Camera'),
               onTap: () {
                 _openCamera(context);
                 },
                 )
           ],)
         ),
       );
       }
       );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(left: 10, top: 20),
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageFile == null ? AssetImage('assets/images/no_image.jpg') : FileImage(imageFile),
                
                ),
                boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(0, 5)
                        )
                      ],
              borderRadius: BorderRadius.circular(55)
            ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 8),
              child: FlatButton(onPressed: () {
                _showChoiceDialog(context);
              }, child: Text('Select Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),))
              ),
            Container(
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: <Widget> [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(UserProductsScreen.routeName);
                    },
                      child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      
                      child: Card(
                        elevation: 10,
                        child: Container(
                          margin: EdgeInsets.all(10),
                
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget> [
                            Icon(Icons.person_add),
                            SizedBox(width: 10,),
                            Text('Manage Products', style: TextStyle(fontSize:16),),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_right)
                          ]
                      ),
                        ),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(OrdersPage.routeName);
                    },
                                      child: Container(
                      height: 60,
                      child: Card(
                        elevation: 10,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                          children: <Widget> [
                            Icon(Icons.history),
                            SizedBox(width: 10,),
                            Text('Purchase History', style: TextStyle(fontSize:16),),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_right)
                          ]
                      ),
                        ),),
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                        children: <Widget> [
                          Icon(Icons.question_answer),
                          SizedBox(width: 10,),
                          Text('Help & Support', style: TextStyle(fontSize:16),),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right)
                        ]
                    ),
                      ),),
                  ),
                  Container(
                    height: 60,
                    
                    child: Card(
                      elevation: 10,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                        children: <Widget> [
                          Icon(Icons.settings),
                          SizedBox(width: 10,),
                          Text('Settings', style: TextStyle(fontSize:16),),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right)
                        ]
                    ),
                      ),),
                  ),
                  Container(
                    height: 60,
                    child: Card(
                      elevation: 10,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                        children: <Widget> [
                          Icon(Icons.person_pin),
                          SizedBox(width: 10,),
                          Text('Invite a friend', style: TextStyle(fontSize:16),),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right)
                        ]
                    ),
                      ),),
                  ),

                ]
              ),
            )
        
        ]
      ),
    );
  }
}