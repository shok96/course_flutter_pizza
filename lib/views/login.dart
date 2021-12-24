/*
 * Created by Roman Kosyachenko on 24.12.2021, 13:43
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 13:37
 */

import 'package:flutter/material.dart';
import 'package:pizza/consts/ImagesConsts.dart';
import 'package:pizza/utils/app_utils.dart';
import 'package:pizza/views/reg.dart';
import 'package:pizza/widgets/ColoredSafeArea.dart';
import 'package:pizza/widgets/button.dart';
import 'package:pizza/widgets/custom_padding.dart';
import 'package:pizza/widgets/input.dart';
import 'package:pizza/widgets/oreders.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController TRef = new TextEditingController();

  TextEditingController TPass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 38),
              child: Column(
                children: [
                  Image.asset(ImagesConsts.logo),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Введите логин в виде 10 цифр номера телефона",
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomPadding(
                    child: Input(
                      hint: "+7",
                      type: TextInputType.phone,
                      obscure: false,
                      controller: TRef,
                      onchange: (e) {},
                    ),
                  ),
                  CustomPadding(
                    child: Input(
                      hint: "Password",
                      type: TextInputType.text,
                      obscure: true,
                      controller: TPass,
                      onchange: (e) {},
                    ),
                  ),
                  CustomPadding(
                    child: Button(
                      text: "Войти",
                      action: () {
                        if (TRef.text.isEmpty || TPass.text.isEmpty)
                          showInSnackBar(
                              context, "Неверный телефон или пароль");
                        else
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Oreders();
                          }));
                      },
                    ),
                    padding: const EdgeInsets.only(top: 28),
                  ),
                  CustomPadding(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Reg();
                        }));
                      },
                      child: const Text(
                        "Регистрация",
                        style: TextStyle(
                            color: Color(0xFF0079D0),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 62),
                  ),
                  CustomPadding(
                      child: GestureDetector(
                        onTap: (){
                          showInSnackBar(context, "А голову ты не заыбл?");
                        },
                        child: const Text(
                    "Забыли пароль?",
                    style: TextStyle(
                          color: const Color(0xFF0079D0),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                  ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
