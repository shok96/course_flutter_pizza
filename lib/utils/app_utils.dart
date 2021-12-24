/*
 * Created by Roman Kosyachenko on 24.12.2021, 17:08
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 17:08
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showInSnackBar(BuildContext context, String value) {
  final snackBar = SnackBar(content: Text(value));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}