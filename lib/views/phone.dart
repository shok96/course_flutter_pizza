/*
 * Created by Roman Kosyachenko on 15.01.2022, 20:36
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 15.01.2022, 20:36
 */

import 'package:flutter/material.dart';
import 'package:pizza/models/User.dart';
import 'package:pizza/utils/app_utils.dart';
import 'package:pizza/widgets/ColoredSafeArea.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(child: Scaffold(
      body: ListView.builder(itemBuilder: (context, index){
        final item = mock[index];
        return GestureDetector(
          onTap: (){
            showInSnackBar(context, "Вы выбрали ${item.name}: ${item.phone}");
          },
          child: Card(
            elevation: 10,
            margin: EdgeInsets.all(8),
            color: Colors.white,
            child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(item.name),
                    Text(item.phone),
                  ],
                ),
              ),
          ),
        );
      },
      itemCount: mock.length,
      ),
    ));
  }
}
