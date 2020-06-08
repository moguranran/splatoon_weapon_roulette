import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:splatoon_weapon_roulette/Weapon/Weapon.dart';

class Player {
  String _name;
  String language;
  List<Weapon> weapons;

  Player(String name, String language) {
    this._name = name;
    this.language = language;
    _makeWeaponList();
    print(weapons.length);
  }

  void _makeWeaponList() async {
    //List<Weapon> weapons = [];
    weapons = [];
    String _loadData = await rootBundle.loadString('assets/weapon.json');
    List js = await jsonDecode(_loadData);

    await _setWeaponList(js);
    return;
  }

  dynamic _setWeaponList(List js) {
    for (var key in js) {
      Weapon weapon = Weapon.fromJson(key, language: this.language);
      this.weapons.add(weapon);
    }
  }
}
