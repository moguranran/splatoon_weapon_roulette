import 'package:flutter/cupertino.dart';

class Weapon {
  final String name;
  final String mainWeapon;
  final String subWeapon;
  final String special;
  String imagePath = '';

  Weapon({this.name, this.mainWeapon, this.subWeapon, this.special, this.imagePath});

  factory Weapon.fromJson(Map<String, dynamic> json, {String language='ja_JP'}){
    return new Weapon(
      name: json['name'][language],
      mainWeapon: json['type']['name'][language],
      subWeapon: json['sub']['name'][language],
      special: json['special']['name'][language],
      imagePath: 'lib/Weapon/Images/${json['key']}.jpg'
    );
  }  
}