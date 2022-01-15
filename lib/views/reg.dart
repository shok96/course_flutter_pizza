/*
 * Created by Roman Kosyachenko on 24.12.2021, 13:43
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 13:37
 */

import 'package:flutter/material.dart';
import 'package:pizza/consts/ImagesConsts.dart';
import 'package:pizza/utils/app_utils.dart';
import 'package:pizza/widgets/ColoredSafeArea.dart';
import 'package:pizza/widgets/button.dart';
import 'package:pizza/widgets/custom_padding.dart';
import 'package:pizza/widgets/input.dart';
import 'package:pizza/widgets/oreders.dart';

class Reg extends StatefulWidget {
  Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {

  TextEditingController TRef = new TextEditingController();

  TextEditingController TPass = new TextEditingController();

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
              padding: EdgeInsets.symmetric(vertical: 34, horizontal: 38),
              child: Column(
                children: [
                 Row(children: [
                   Icon(Icons.people, color: Color(0xFF5C5C5C),),
                   SizedBox(width: 9,),
                   Text("Регистрация", style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Color(0xFF5C5C5C), fontSize: 20, fontWeight: FontWeight.w800),)
                 ],
                   mainAxisSize: MainAxisSize.min,
                 ),
                  CustomPadding(child: Container(width: double.infinity, height: 1, color: Color(0xFFC4C4C4),), padding: EdgeInsets.only(top: 15),),
                  Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      "Чтобы зарегистрироваться введите свой номер телефона и почту",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(0xFFC4C4C4),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomPadding(
                      padding: EdgeInsets.only(top: 14),
                      child: Text("Телефон", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54),)),
                  CustomPadding(
                    padding: EdgeInsets.only(top: 6),
                    child: Input(
                      hint: "+7",
                      type: TextInputType.phone,
                      obscure: false,
                      controller: TRef,
                      onchange: (e) {},
                    ),
                  ),
                  CustomPadding(
                      padding: EdgeInsets.only(top: 14),
                      child: Text("Почта", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54),)),
                  CustomPadding(
                    padding: EdgeInsets.only(top: 6),
                    child: Input(
                      hint: "email",
                      type: TextInputType.emailAddress,
                      obscure: false,
                      controller: TPass,
                      onchange: (e) {},
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      "Вам придет четырехзначный код, который будет вашим паролем",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(0xFFC4C4C4),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 14),
                    child: Text(
                      "Изменить пароль можно будет в личном кабинете после регистрации",
                      style: TextStyle(
                          color: Color(0xFFC4C4C4),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomPadding(
                    child: Button(
                      action: () {
                        if (TRef.text.isEmpty || TPass.text.isEmpty)
                          showInSnackBar(
                              context, "Неверный телефон или почта");
                        else
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Oreders();
                          }));
                      },
                      text: "Отправить код",
                    ),
                    padding: EdgeInsets.only(top: 32),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
