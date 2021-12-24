/*
 * Created by Roman Kosyachenko on 24.12.2021, 17:44
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 17:44
 */

import 'package:flutter/material.dart';

class Sliders extends StatefulWidget {

  Function(int coast) onChange;
  int size;

  Sliders({Key? key, required this.onChange, this.size = 10}) : super(key: key);

  List<Map<String, dynamic>> dict = [
    {"name": "Обычное тесто", "id":0, "coast":5},
    {"name": "Тонкое тесто", "id":1, "coast":10},
  ];

  @override
  _SlidersState createState() => _SlidersState(value: size.toDouble());
}

class _SlidersState extends State<Sliders> {

  double value;

  _SlidersState({this.value = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFFECEFF1), borderRadius: BorderRadius.circular(36)),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                value.round().toString(),
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 10,
            child: Slider.adaptive(
              value: value,
              max: 100,
              divisions: 10,
              label: value.round().toString(),
              onChanged: (double value) {
                this.widget.onChange(value.toInt());
                setState(() {
                  this.value = value;
                });
              },
            ),
          )
        ],
      )
    );
  }
}
