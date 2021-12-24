/*
 * Created by Roman Kosyachenko on 24.12.2021, 13:43
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 13:28
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizza/views/login.dart';
import 'package:pizza/views/reg.dart';
import 'package:pizza/widgets/oreders.dart';

Future main() async{
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pizza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

