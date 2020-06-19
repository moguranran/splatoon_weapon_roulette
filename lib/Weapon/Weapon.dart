class Weapon {
  final String name;
  // final String mainWeapon;
  // final String subWeapon;
  // final String special;
  String imagePath = '';

  final MainWeapon mainWeapon;
  final SubWeapon subWeapon;
  final SpecialWeapon specialWeapon;

  // Weapon(
  //     {this.name,
  //     this.mainWeapon,
  //     this.subWeapon,
  //     this.special,
  //     this.imagePath});

  // factory Weapon.fromJson(Map<String, dynamic> json,
  //     {String language = 'ja_JP'}) {
  //   return new Weapon(
  //       name: json['name'][language],
  //       mainWeapon: json['type']['name'][language],
  //       subWeapon: json['sub']['name'][language],
  //       special: json['special']['name'][language],
  //       imagePath: 'lib/Weapon/Images/${json['key']}.jpg');
  // }
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
        mainWeapon: MainWeapon(json['type']['name'][language]),
        subWeapon: SubWeapon(json['sub']['name'][language]),
        specialWeapon: SpecialWeapon(json['special']['name'][language]),
        imagePath: 'lib/Weapon/Images/${json['key']}.jpg');
  }

  void changeChecked(WeaponType type, bool isChecked){
    type.changeChecked(isChecked);
  }
}

class WeaponType {
  final String type;
  bool _isChecked = true;
  get isChecked => _isChecked;
  bool _isChoiced = false;
  get isChoiced => _isChoiced;

  void changeChecked(bool isChecked){
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
