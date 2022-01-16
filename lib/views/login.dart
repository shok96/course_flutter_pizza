/*
 * Created by Roman Kosyachenko on 24.12.2021, 13:43
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 13:37
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pizza/consts/ImagesConsts.dart';
import 'package:pizza/utils/app_utils.dart';
import 'package:pizza/views/reg.dart';
import 'package:pizza/widgets/ColoredSafeArea.dart';
import 'package:pizza/widgets/button.dart';
import 'package:pizza/widgets/custom_padding.dart';
import 'package:pizza/widgets/input.dart';
import 'package:pizza/widgets/oreders.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController TRef = new TextEditingController();

  TextEditingController TPass = new TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/pass.txt');
  }

  Future<File> writePass(String pass) async {
    final file = await _localFile;
    return file.writeAsString(pass);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      color: Theme.of(context).scaffoldBackgroundColor,
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
                 Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Введите логин в виде 10 цифр номера телефона",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
                      action: () async{
                        if (TRef.text.isEmpty || TPass.text.isEmpty)
                          showInSnackBar(
                              context, "Неверный телефон или пароль");
                        else{
                          final SharedPreferences prefs = await _prefs;
                          await prefs.setString("login", TRef.text);
                          await writePass(TPass.text);

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Oreders();
                          }));
                        }
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
                      child:  Text(
                        "Регистрация",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
                        child: Text(
                    "Забыли пароль?",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
