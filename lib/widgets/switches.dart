/*
 * Created by Roman Kosyachenko on 24.12.2021, 17:44
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 17:44
 */

import 'package:flutter/material.dart';

class Switches extends StatefulWidget {

  Function(int coast) onChange;

  Switches({Key? key, required this.onChange}) : super(key: key);

  List<Map<String, dynamic>> dict = [
    {"name": "Обычное тесто", "id":0, "coast":5},
    {"name": "Тонкое тесто", "id":1, "coast":10},
  ];

  @override
  _SwitchesState createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {

  int idCurrent = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFFECEFF1), borderRadius: BorderRadius.circular(36)),
      child: Row(
        children: [
         Expanded(
           child: GestureDetector(
               onTap: (){
                 widget.onChange(widget.dict[0]["coast"]);
                 setState(() {
                   idCurrent = 0;
                 });
               },
               child: idCurrent == 0 ? ActiveState(widget.dict[0]["name"]): InActiveState(widget.dict[0]["name"])),
         ),
         Expanded(
           child: GestureDetector(
               onTap: (){
                 widget.onChange(widget.dict[1]["coast"]);
                 setState(() {
                   idCurrent = 1;
                 });
               },
               child: idCurrent == 1 ? ActiveState(widget.dict[1]["name"]): InActiveState(widget.dict[1]["name"])),
         ),

        ],
      ),
    );
  }
}

class ActiveState extends StatelessWidget {

  String text;

  ActiveState(this.text);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Color(0xFF0079D0),
          borderRadius: BorderRadius.circular(36)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

}

class InActiveState extends StatelessWidget {

  String text;

  InActiveState(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

}


