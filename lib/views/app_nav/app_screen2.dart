/*
 * Created by Roman Kosyachenko on 15.01.2022, 15:40
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 15.01.2022, 15:40
 */

import 'package:flutter/material.dart';
import 'package:pizza/widgets/ColoredSafeArea.dart';

class AppScreen2 extends StatelessWidget {
  const AppScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: Scaffold(
      body: Center(child: Text("экран 2"),),
    ));
  }
}
