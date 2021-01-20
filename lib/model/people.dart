
import 'package:flutter/material.dart';
class People {
  int id;
  String name;
  String image;
  String email;
  String subtitle;
  String number =" 0";

  bool isFavorite=false;

  /*int charisma = 0;
  int stamina = 0;
  Origin origin;*/

  People({
    @required this.id,
    @required this.name,
    @required this.number,
    @required this.email,
     this.subtitle,
     this.image='assets/images/unknown.jpg',


    //this.isFavorite=false
    /*@required this.charisma,
    @required this.stamina,
    @required this.origin,*/
  });

  toggle(){
    isFavorite = !isFavorite;
  }

  @override
  String toString() {
    return 'People{id: $id, name: $name, image: $image, number: $number,email: $email}';
  }
}
