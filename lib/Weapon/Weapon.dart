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
        mainWeapon: MainWeapon(json['type']['key']),
        subWeapon: SubWeapon(json['sub']['key']),
        specialWeapon: SpecialWeapon(json['special']['key']),
        imagePath: 'lib/Weapon/Images/${json['key']}.jpg');
  }

  void changeChecked(WeaponType type, bool isChecked) {
    type.changeChecked(isChecked);
  }

  void showType() {
    print(
        'main:${mainWeapon.type} , sub:${subWeapon.type} , special:${specialWeapon.type}');
  }
}

class WeaponType {
  final String type;
  bool _isChecked = true;
  get isChecked => _isChecked;
  bool _isChoiced = false;
  get isChoiced => _isChoiced;

  void changeChecked(bool isChecked) {
    _isChecked = isChecked;
  }

  WeaponType(this.type);
}

class MainWeapon extends WeaponType {
  MainWeapon(String mainType) : super(mainType);
}

class SubWeapon extends WeaponType {
  SubWeapon(String subType) : super(subType);
}

class SpecialWeapon extends WeaponType {
  SpecialWeapon(String specialType) : super(specialType);
}
