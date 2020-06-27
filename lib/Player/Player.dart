import 'dart:convert';
import 'dart:math';
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
  List<Weapon> _candidates;
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

    _candidates = weapons;
  }

  void changeWeaponsState(String weapon, String key, bool isChecked) {
    var weaponType = _checkWeaponType(weapon, key);
    if (weaponType == null) return;

    weaponType[key] = isChecked;

    if(weaponType.values.every((element) => element == false))
    weaponType[key] = !isChecked;
    
    weaponType.forEach((key, value) {
      weapons
          .where((element) => element.mainWeapon.type == key)
          .forEach((element) => element.mainWeapon.changeChecked(value));
      
      weapons
          .where((element) => element.subWeapon.type == key)
          .forEach((element) => element.subWeapon.changeChecked(value));
      
      weapons
          .where((element) => element.specialWeapon.type == key)
          .forEach((element) => element.specialWeapon.changeChecked(value));
    });

    _makeCandiateWeapons();
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

  void _makeCandiateWeapons() {
    _candidates = weapons.where((weapon) => weapon.isCandidate()).toList();

    if (_candidates == null || _candidates.length == 0) _candidates = weapons;

    _shuffle();

    _weaponIndex = 0;
  }

  void _shuffle(){
    int n = _candidates.length - 1;
    var rand = Random();
    var tmpList = List<Weapon>(_candidates.length);

    while(n >= 0){
      int index = rand.nextInt(_candidates.length);

      if(tmpList[n] == null && _candidates[index] != null){
        tmpList[n]  = _candidates[index];
        _candidates[index] = null;
        n--;
      }
    }

    _candidates = tmpList;
  }

  int _weaponIndex = 0;

  void roulette() {
    print(_candidates.length);

    if(isLocked) return;

    _weapon = _candidates[_weaponIndex];
    _weaponIndex++;
    if (_weaponIndex >= _candidates.length) _weaponIndex = 0;
  }
}
