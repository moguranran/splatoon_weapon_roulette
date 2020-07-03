class Weapon {
  final String name;

  String imagePath = '';

  final MainWeapon mainWeapon;
  final SubWeapon subWeapon;
  final SpecialWeapon specialWeapon;

  Weapon(
      {this.name,
      this.mainWeapon,
      this.subWeapon,
      this.specialWeapon,
      this.imagePath});

  factory Weapon.fromJson(Map<String, dynamic> json,
      {String language = 'ja_JP'}) {
    return new Weapon(
        name: json['name'][language],
        mainWeapon: MainWeapon(json['type']['key'], json['type']['name']),
        subWeapon: SubWeapon(json['sub']['key'], json['sub']['name']),
        specialWeapon: SpecialWeapon(json['special']['key'], json['special']['name']),
        imagePath: 'lib/Weapon/Images/${json['key']}.jpg');
  }

  void changeChecked(WeaponType type, bool isChecked) {
    type.changeChecked(isChecked);
  }

  void showType() {
    print(
        'main:${mainWeapon.type} , sub:${subWeapon.type} , special:${specialWeapon.type}');
  }

  bool isCandidate() {
    if (mainWeapon.isChecked && subWeapon.isChecked && specialWeapon.isChecked)
      return true;

    return false;
  }
}

class WeaponType {
  final String type;
  final Map<String, dynamic> names;
  bool _isChecked = true;
  get isChecked => _isChecked;
  bool _isChoiced = false;
  get isChoiced => _isChoiced;

  void changeChecked(bool isChecked) {
    _isChecked = isChecked;
  }

  WeaponType(this.type, this.names);

  void changeLanguage(String language){
    
  }
}

class MainWeapon extends WeaponType {
  MainWeapon(String mainType, Map<String, dynamic> names) : super(mainType, names);
}

class SubWeapon extends WeaponType {
  SubWeapon(String subType, Map<String, dynamic> names) : super(subType, names);
}

class SpecialWeapon extends WeaponType {
  SpecialWeapon(String specialType, Map<String, dynamic> names) : super(specialType, names);
}
