/*
 * Created by Roman Kosyachenko on 16.01.2022, 13:20
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 16.01.2022, 13:20
 */


class Post {
    String? body;
    int? id;
    String? title;
    int? userId;

    Post({this.body, this.id, this.title, this.userId});

    factory Post.fromJson(Map<String, dynamic> json) {
        return Post(
            body: json['body'], 
            id: json['id'], 
            title: json['title'], 
            userId: json['userId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['body'] = this.body;
        data['id'] = this.id;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }
}