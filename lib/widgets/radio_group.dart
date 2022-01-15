/*
 * Created by Roman Kosyachenko on 24.12.2021, 18:40
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 18:40
 */

import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  Function(int coast) onChange;

  RadioGroup({Key? key, required this.onChange}) : super(key: key);

  List<Map<String, dynamic>> dict = [
    {"name": "Острый", "id":0, "coast":5},
    {"name": "Кисло-сладкий", "id":1, "coast":6},
    {"name": "Сырный", "id":2, "coast":8},
  ];

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {

  int idCurrent = -1;



  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: widget.dict.map((e) => Column(
        children: [
          ListTile(
            title: Text(e["name"]),
            trailing: Radio(
            //  activeColor: Color(0xFF5DB075),
              onChanged: (value) {
                widget.onChange(e["coast"]);
                setState(() {
                  idCurrent = e["id"];
                });
              }, groupValue: e["id"], value: idCurrent,),
          ),
          Divider()
        ],
      )).toList(),
 );
  }
}
