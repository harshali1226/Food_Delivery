import 'package:flutter/material.dart';
import '../pages/sign_up_page.dart';
class SignIn extends StatefulWidget {
  static const routeName = '/signin';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  bool _togglePassword = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 140),
            child: Text('Sign In', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
          SizedBox(height: 50,),
          Container(
           margin: EdgeInsets.only(right: 20),
           alignment: Alignment.centerRight,
            child: Text('Forgotten Password?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.blue))),
          SizedBox(height: 10),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 10,
            child: Container(
            
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Form(
                child: Column(children: <Widget>[
                  TextFormField(
                  
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Your Email or ID',hintStyle: TextStyle(fontSize: 18))
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 18),
                      suffixIcon: IconButton(
                        icon: _togglePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility), onPressed: () {
                        setState(() {
                          _togglePassword = !_togglePassword;
                        });
                        
                      })
                      ),
                      obscureText: _togglePassword,
                      
                  ),
                  SizedBox(height: 20),
                  
                  //SizedBox(height: 10,)
                ],),
              )
            ),),
            SizedBox(height: 6,),
            GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(15),
                     // color: Colors.blue,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue
                      ),
                      child: Text('Submit', 
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,
                      ),
                      ),
                     // SizedBox(height: 10,)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      children: <Widget>[
                        Text('Do you have an account?', style: TextStyle(fontSize: 16, color: Colors.grey),),
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(SignUp.routeName);
                          },
                          child: Text('SignUp',style: TextStyle(fontSize: 20, color: Colors.blue,fontWeight: FontWeight.bold),))
                      ]
                    ),
                  )
          ],)
        ),
    );
  }
}