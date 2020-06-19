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
  Weapon _weapon;
  Weapon get weapon => _weapon;

  Player(String name, String language, int index) {
    this._name = name;
    this.language = language;
    this._index = index;
    _isLocked = false;
    _weapon = null;
    _makeWeaponList();
  }

  void changeName(String name) {
    _name = name;
    print('$_name');
  }

  void changeLocked() {
    _isLocked = !isLocked;
  }

  void _makeWeaponList() async {
    weapons = [];
    String _loadData = await rootBundle.loadString('assets/weapon.json');
    List js = await jsonDecode(_loadData);

    await _makeList(js);
    return;
  }

  dynamic _makeList(List js) {
    for (var key in js) {
      Weapon weapon = Weapon.fromJson(key, language: this.language);
      this.weapons.add(weapon);
    }
  }

  void setWeaponList(bool mainChecked, bool subChecked, bool specialChecked){
    for (var weapon in weapons) {
      weapon.changeChecked(weapon.mainWeapon, mainChecked);
      weapon.changeChecked(weapon.subWeapon, subChecked);
      weapon.changeChecked(weapon.specialWeapon, specialChecked);
    }
  }

  int count = 0;

  void changeWeapon() {
    if (isLocked) return;

    _weapon = weapons[count];
    count++;
    if (count > 138) count = 0;
  }

  void roulette(){

  }
}
