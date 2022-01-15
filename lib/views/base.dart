/*
 * Created by Roman Kosyachenko on 15.01.2022, 15:49
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 15.01.2022, 15:49
 */

import 'package:flutter/material.dart';
import 'package:pizza/views/app_nav/app_screen1.dart';
import 'package:pizza/views/app_nav/app_screen2.dart';
import 'package:pizza/widgets/oreders.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;

  final nKey = GlobalKey();

  static const List<Map<String, String>> _path = [
    {"path": "base/order", "name": "Заказ"},
    {"path": "base/app1", "name": "app1"},
    {"path": "base/app2", "name": "app2"}
  ];

  void _onItemTapped(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pushReplacementNamed(_path[index]["path"]!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: FlutterLogo(
                style: FlutterLogoStyle.stacked,
                size: 90,
              ),
            ),
            Column(
              children:  _path.map((e) => ListTile(
                title: Text(e["name"]!),
                onTap: () async{
                  Navigator.pop(context);
                  _onItemTapped(nKey.currentContext!, _path.indexOf(e));

                },
              )).toList(),
            )


          ],
        ),
      ),
      body: Center(
        child: Navigator(
          key: nKey,
          initialRoute: "base/order",
          onGenerateRoute: (settings) {
            WidgetBuilder? builder;
            switch (settings.name) {
              case "base/order":
                builder = (BuildContext context) => Oreders();
                break;
              case "base/app1":
                builder = (BuildContext context) => AppScreen1();
                break;
              case "base/app2":
                builder = (BuildContext context) => AppScreen2();
                break;
            }
            return MaterialPageRoute(builder: builder!, settings: settings);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Заказ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'app1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'app2',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (id) => _onItemTapped(nKey.currentContext!, id),
      ),
    );
  }
}
