import 'package:flutter/material.dart';
import 'package:utstpm/menu.dart';

class LoginPage extends StatefulWidget {
  LoginPage({ Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String id = "";
  String pw = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("UTS TPM"),
          backgroundColor: Colors.blue
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            _usernameField(),
            _passwordField(),
            _loginButton()
          ],
        )
      ),
    );
  }

  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          id = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(
          ),
          hintText: 'Input Username',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.blue
            )
          )
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          pw = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Input Password',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
            color: Colors.blue
            )
          )
        ),
      ),
    );
  }

  Widget _loginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue
        ),
        child: Text("Login"),
        onPressed: () {
          String info = "";
          if (id=="123200130" && pw=="maulana"){
            setState(() {
              info = "Login Success";
            });
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => MainMenu())
            );
          }else{
            setState(() {
              info = "Unknown Username or Password";
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(info)
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        ),
    );
  }
}