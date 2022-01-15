/*
 * Created by Roman Kosyachenko on 15.01.2022, 20:30
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 15.01.2022, 20:30
 */

class User{

  String name;
  String phone;

  User({required this.name, required this.phone});

}

List<User> get mock => [
  User(name: "Roma",phone: "+79245236528"),
  User(name: "Anton",phone: "+79542412525"),
  User(name: "Andrey",phone: "+7941254225"),
  User(name: "Masha",phone: "+71212554545"),
  User(name: "Kate",phone: "+740452324"),
  User(name: "Alina",phone: "+700222532"),
  User(name: "Vika",phone: "+745111565"),
  User(name: "Veronika",phone: "+751124524"),
  User(name: "Anna",phone: "+7225155"),
  User(name: "Anastasia",phone: "+74254235423"),
  User(name: "Rita",phone: "+7234532434"),
  User(name: "Kseniya",phone: "+7233453143"),
];