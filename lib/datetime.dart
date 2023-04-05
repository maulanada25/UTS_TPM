import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatenTime extends StatefulWidget {
  const DatenTime({ Key? key }) : super(key: key);

  @override
  State<DatenTime> createState() => _DatenTimeState();
}

class _DatenTimeState extends State<DatenTime> {
  String _timeString = "";
  bool wib = false;
  bool wita = true;
  bool wit = false;

    @override
    void initState() {
      _timeString = _formatDateTime(DateTime.now());
      Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Date and Time"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      wib = true;
                      wita = false;
                      wit = false;
                    });
                  }, child: Text("WIB"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red; // set color when button is pressed
                          } else {
                            return wib ? Colors.red : Colors.blue; // set color for default state based on _isPressed value
                          }
                        },
                      )
                    ),  
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      wib = false;
                      wita = true;
                      wit = false;
                    });
                  }, child: Text("WITA"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red; // set color when button is pressed
                          } else {
                            return wita ? Colors.red : Colors.blue; // set color for default state based on _isPressed value
                          }
                        },
                      )
                    ),  
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      wib = false;
                      wita = false;
                      wit = true;
                    });
                  }, child: Text("WIT"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red; // set color when button is pressed
                          } else {
                            return wit ? Colors.red : Colors.blue; // set color for default state based on _isPressed value
                          }
                        },
                      )
                    ),  
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text("Time :",
              style: TextStyle(
                fontSize: 18
              ),
            ),
            SizedBox(height: 15,),
            Text(_timeString,
              style: TextStyle(
                fontSize: 17
              ),
            )
          ],
        ),
      ),
    ));
  }

  void _getTime() {     
    final DateTime now = (wib) ? DateTime.now() : (wita) ? DateTime.now().add(Duration(hours: 1)) : (wit) ? DateTime.now().add(Duration(hours: 2)) : DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

}