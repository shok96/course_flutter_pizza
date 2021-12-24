
/*
 * Created by Roman Kosyachenko on 24.12.2021, 13:43
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 13:43
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Input extends StatelessWidget {
  final Icon? icon;
  final String? hint;
  final TextEditingController? controller;
  final bool? obscure;
  final TextInputType? type;
  final List<TextInputFormatter>? formater;
  Function(String)? onchange;
  bool marginTop;

  Input({this.controller, this.icon, this.hint, this.obscure, this.type, this.formater, this.onchange, this.marginTop = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: onchange,
        inputFormatters: formater ?? [],
        keyboardType: type ?? TextInputType.text,
        controller: controller,
        obscureText: obscure ?? false,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black45),
        decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Color(0xFFECEFF1),
            contentPadding: EdgeInsets.only(left: 12.0, bottom: 7, top: 8),
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black45),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color(0xFFECEFF1), width: 1),
              borderRadius: BorderRadius.circular(36),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color(0xFFECEFF1), width: 1),
              borderRadius: BorderRadius.circular(36),
            ),
            prefixIcon: icon != null
                ? Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.grey),
                      child: icon!,
                    ),
                  )
                : null),
      ),
    );
  }
}
