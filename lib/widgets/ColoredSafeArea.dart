
/*
 * Created by Roman Kosyachenko on 24.12.2021, 13:43
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 13:28
 */

import 'package:flutter/material.dart';



class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  Color? color;

  ColoredSafeArea({Key? key, required this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.white,
      child: SafeArea(
        bottom: false,
        child: child,
      ),
    );
  }
}