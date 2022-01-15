/*
 * Created by Roman Kosyachenko on 15.01.2022, 15:40
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 15.01.2022, 15:40
 */

import 'package:flutter/material.dart';
import 'package:pizza/widgets/ColoredSafeArea.dart';

class AppScreen1 extends StatelessWidget {
  const AppScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        color: Theme.of(context).primaryColor,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.navigate_next),
                onPressed: () {
                  Navigator.of(context).pushNamed("base/app2");
                },
              ),
            ],
          ),
          body: Center(
            child: Text("экран 1"),
          ),
        ));
  }
}
