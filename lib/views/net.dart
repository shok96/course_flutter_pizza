/*
 * Created by Roman Kosyachenko on 16.01.2022, 13:28
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 16.01.2022, 13:28
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pizza/model/Post.dart';
import 'package:pizza/widgets/ColoredSafeArea.dart';
import 'package:http/http.dart' as http;

class Net extends StatelessWidget {
  const Net({Key? key}) : super(key: key);

  Future<Post> _getPost() async {
    var client = http.Client();
    String sResponse = "";
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var response = await http.get(url);
      sResponse = utf8.decode(response.bodyBytes);
    } finally {
      client.close();
    }
    var decodedResponse = jsonDecode(sResponse) as Map<String, dynamic>;
    return Post.fromJson(decodedResponse);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: Scaffold(
      body: FutureBuilder<Post>(
        future: _getPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Title: ${data.title}"),
                        Divider(),
                        Text("Body: ${data.body}")
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    ));
  }
}
