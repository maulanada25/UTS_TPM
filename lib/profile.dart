import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  String dreams = "When I was child, I always has a dream to be like my grandfather, a geologist. I like it when I had to go to field trip and studying stones and stuff. But for now, my dreams aren't like what it used to. I just wanna have a good future with lots of money on my bank accounts and marry the love of my life.";
  bool details = false;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  SizedBox(child: Image.asset("images/daffamerah4x3.jpg", width: 210,height: 280,)),
                  SizedBox(height: 20,),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Name : Maulana Daffa Ardiansyah',
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'NIM : 123200130',
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Kelas : H',
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  Visibility(
                    visible: (details) ? true : false,
                    child: Column(
                      children: [
                        TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: 'TTL : Sleman, 25 Mei 2002',
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            labelStyle: TextStyle(
                              color: Colors.black
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Text("Dreams :", 
                            style: TextStyle(
                              fontSize: 17
                            ),),
                        ),
                        SizedBox(height: 7,),
                        Container(
                          child: Text(dreams,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15
                          )
                          ),
                        ),
                        SizedBox(height: 15,),
                      ],
                    )
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        details = !details; // toggle the value of _isPressed
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red; // set color when button is pressed
                          } else {
                            return details ? Colors.red : Colors.blue; // set color for default state based on _isPressed value
                          }
                        },
                      ),
                    ),child: Text(details ? "Hide" : "More")),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}