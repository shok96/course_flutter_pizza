/*
 * Created by Roman Kosyachenko on 24.12.2021, 17:14
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 17:14
 */

import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {

  EdgeInsetsGeometry? padding;
  Widget child;

  CustomPadding({Key? key, this.padding, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding != null ? padding! : EdgeInsets.only(top: 20), child: child);
  }
}
