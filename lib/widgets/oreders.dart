/*
 * Created by Roman Kosyachenko on 24.12.2021, 17:36
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 24.12.2021, 17:36
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pizza/consts/ImagesConsts.dart';
import 'package:pizza/utils/app_utils.dart';
import 'package:pizza/views/phone.dart';
import 'package:pizza/widgets/ColoredSafeArea.dart';
import 'package:pizza/widgets/Sliders.dart';
import 'package:pizza/widgets/button.dart';
import 'package:pizza/widgets/custom_padding.dart';
import 'package:pizza/widgets/header_text.dart';
import 'package:pizza/widgets/radio_group.dart';
import 'package:pizza/widgets/switches.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Oreders extends StatefulWidget {
  Oreders({Key? key}) : super(key: key);

  @override
  _OredersState createState() => _OredersState();
}

class _OredersState extends State<Oreders> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool chese = false;
  int size = 60;
  int souces = 5;
  int type = 5;

  String get coast {
    int coast = 100;
    if (chese) coast += 100;
    coast += (size * 1.5).round();
    coast += (souces * 2).round();
    coast += (type * 8).round();
    return "${coast} рублей.";
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/pass.txt');
  }

  Future<String> readPass() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "";
    }
  }

  Future<String> getTitle() async{
    final SharedPreferences prefs = await _prefs;
    String login = await prefs.getString('login') ?? "";
    String pass = await readPass();
    return "${login} - ${pass}";
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: FutureBuilder<String>(
            future: getTitle(),
            builder: (context, snapshot) {
              if(snapshot.hasData)
              return Text(snapshot.data!);
              else
                return Text("Loading...");
            }
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder) => Phone()));
            }, child: Text("List", style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black)))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(ImagesConsts.pizza)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      CustomPadding(
                          child: Text(
                        "Калькулятор пиццы",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.black),
                      )),
                      CustomPadding(
                        child:  Text(
                          "Выберите параметры:",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        padding: EdgeInsets.only(top: 9),
                      ),
                      CustomPadding(
                        child: Switches(
                          onChange: (coast) {
                            setState(() {
                              type = coast;
                            });
                          },
                        ),
                        padding: EdgeInsets.only(top: 33),
                      ),
                      CustomPadding(
                        child: HeaderText(
                          text: "Размер:",
                          child: Sliders(
                              size: size,
                              onChange: (value) {
                                setState(() {
                                  size = value;
                                });
                              }),
                        ),
                      ),
                      CustomPadding(
                        child: HeaderText(
                          text: "Соус:",
                          child: RadioGroup(onChange: (value) {
                            setState(() {
                              souces = value;
                            });
                          }),
                        ),
                      ),
                      CustomPadding(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(ImagesConsts.cheese),
                              Text("Дополнительный сыр",
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xFF263238),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)),
                              Switch(
                                  value: chese,
                                  onChanged: (value) {
                                    setState(() {
                                      chese = value;
                                    });
                                  })
                            ],
                          ),
                        ),
                      )),
                      CustomPadding(
                        child: HeaderText(
                          text: "Стоимость:",
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFECEFF1),
                                borderRadius: BorderRadius.circular(36)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              child: Text(coast),
                            ),
                          ),
                        ),
                      ),
                      CustomPadding(child: Button(text: "Заказать", action: (){
                        showInSnackBar(context, "Ваш заказ принят");
                      },))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
