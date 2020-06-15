import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:splatoon_weapon_roulette/Weapon/Weapon.dart';

class Player extends ChangeNotifier {
  String _name;
  String get name => _name;
  String language;
  int _index;
  int get index => _index;
  List<Weapon> weapons;
  bool _isLocked;
  bool get isLocked => _isLocked;

  Player(String name, String language, int index){
    this._name = name;
    this.language = language;
    this._index = index;
    _isLocked = false;
    _makeWeaponList();
  }


  void changeName(String name){
    _name = name;
    print('$_name');
  }

  void changeLocked(){
    _isLocked = !isLocked;
  }

  void _makeWeaponList() async {
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
