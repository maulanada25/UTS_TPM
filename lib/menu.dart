import 'package:flutter/material.dart';
import 'calculate.dart';
import 'login.dart';
import 'profile.dart';
import 'datetime.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({ Key? key }) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Main Menu"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.account_box_rounded, size: 35,),
                    onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => Profile())
                      );
                  }, label: Text("Profil")),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.calculate_outlined, size: 35,),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Calculate())
                      );
                  }, label: Text("Hitung")),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.calendar_today_sharp, size: 28,),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => DatenTime())
                      );
                  }, label: Text("Kalender")),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.logout, size: 28,),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => LoginPage())
                      );
                    }, label: Text("Log Out"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}