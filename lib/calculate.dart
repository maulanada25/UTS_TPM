import 'dart:math';

import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({ Key? key }) : super(key: key);

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  final _textController = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
  double a = 0;
  double b = 0;
  double c = 0;
  // double d = 22/7;
  double result = 0;
  String empty = "0";
  bool mode = true;
  bool mode2 = true;
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(mode ? "Trapezoid" : "Cylinder"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextButton(onPressed: () {
              setState(() {
                mode = !mode;
                result = 0;
                a = 0; b = 0; c = 0;
                _textController.clear();
                _textController2.clear();
              });
            }, child: Text("Switch",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: (mode) ? 'Atap' : 'Jari-jari',
                  hintText: '0',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blue  
                    )
                  ),
                ),
                onChanged: (value) {
                  a = double.parse(value);
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _textController2,
                decoration: InputDecoration(
                  labelText: (mode) ? 'Alas' : 'Tinggi',
                  hintText: '0',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blue  
                    )
                  ),
                ),
                onChanged: (value) {
                  b = double.parse(value);
                },
              ),
              SizedBox(height: 15,),
              Visibility(
                visible: (mode) ? true : false,
                child: TextFormField(
                  controller: _textController3,
                  decoration: InputDecoration(
                    labelText: (mode2) ? "Miring" : "Tinggi",
                    hintText: '0',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blue  
                      )
                    ),
                  ),
                  onChanged: (value) {
                    c = double.parse(value);
                  },
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(onPressed: () {
                      setState(() {
                        result = (mode) ? ((mode2) ? a+b+c+c : ((a+b)/2)*c) : ((mode2) ? (pi*a*a*b) : (2*pi*(a*a))+(2*pi*a*b));
                      });
                    }, child: Text("Calculate")),
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(onPressed: () {
                      setState(() {
                        mode2 = !mode2;
                        result = 0;
                        _textController3.clear();
                      });
                    }, child: Text(mode2 ? "Luas?" : mode ? "Keliling?" : "Volume?")),
                  ),
                ],
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: ((mode2) ? (mode) ? "Keliling : " : "Volume : " : "Luas : ") + result.toString(),
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}