class Weapon {
  final String name;
  final String mainWeapon;
  final String subWeapon;
  final String special;

  Weapon({this.name, this.mainWeapon, this.subWeapon, this.special});

  factory Weapon.fromJson(Map<String, dynamic> json, {String language='ja_JP'}){
    return new Weapon(
      name: json['name'][language],
      mainWeapon: json['type']['name'][language],
      subWeapon: json['sub']['name'][language],
      special: json['special']['name'][language],
    );
  }
}