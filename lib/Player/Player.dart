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

  Map<String, bool> mainWeapon = {
    'shooter': true,
    'blaster': true,
    'reelgun': true,
    'roller': true,
    'brush': true,
    'charger': true,
    'slosher': true,
    'splatling': true,
    'maneuver': true,
    'brella': true,
  };

  Map<String, bool> subWeapon = {
    'splashbomb': true,
    'kyubanbomb': true,
    'quickbomb': true,
    'curlingbomb': true,
    'robotbomb': true,
    'trap': true,
    'sprinkler': true,
    'poisonmist': true,
    'pointsensor': true,
    'splashshield': true,
    'jumpbeacon': true,
    'tansanbomb': true,
    'torpedo': true,
  };

  Map<String, bool> specialWeapon = {
    'missile': true,
    'armor': true,
    'splashbomb_pitcher': true,
    'kyubanbomb_pitcher': true,
    'quickbomb_pitcher': true,
    'curlingbomb_pitcher': true,
    'robotbomb_pitcher': true,
    'presser': true,
    'jetpack': true,
    'chakuchi': true,
    'amefurashi': true,
    'sphere': true,
    'bubble': true,
    'nicedama': true,
    'ultrahanko': true,
  };

  Player(String name, String language, int index) {
    this._name = name;
    this.language = language;
    this._index = index;
    _isLocked = false;
    _weapon = null;
    _initWeaponList();
  }

  void changeName(String name) {
    _name = name;
  }

  void changeLocked() {
    _isLocked = !isLocked;
  }

  void _initWeaponList() async {
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

  // void setWeaponList(bool mainChecked, bool subChecked, bool specialChecked) {
  //   for (var weapon in weapons) {
  //     weapon.changeChecked(weapon.mainWeapon, mainChecked);
  //     weapon.changeChecked(weapon.subWeapon, subChecked);
  //     weapon.changeChecked(weapon.specialWeapon, specialChecked);
  //   }
  // }

  int count = 0;

  void changeWeapon() {
    if (isLocked) return;

    _weapon = weapons[count];
    count++;
    if (count > 138) count = 0;
  }

  void changeWeaponsState(String weapon, String key, bool isChecked) {
    var weaponType = _checkWeaponType(weapon, key);
    if (weaponType == null) return;

    weaponType[key] = isChecked;
    
    weaponType.forEach((key, value) {
      print('$name  $key is $value');
    });
  }

  Map _checkWeaponType(String weapon, String key) {
    var weaponType = weapon.substring(0, weapon.length - 'weapon'.length);
    if (weaponType != 'main' && weaponType != 'sub' && weaponType != 'special')
      return null;

    if (mainWeapon.containsKey(key)) return mainWeapon;
    if (subWeapon.containsKey(key)) return subWeapon;
    if (specialWeapon.containsKey(key)) return specialWeapon;

    return null;
  }

  void roulette() {}
}
