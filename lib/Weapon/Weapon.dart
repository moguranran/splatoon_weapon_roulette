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

// enum MainWeapon {
//   Shooter,
//   Blaster,
//   Maneuver,
//   Reelgun,
//   Roller,
//   Brush,
//   Charger,
//   Slosher,
//   Splatling,
//   Brella
// }

// enum SubWeapon {
//   Splashbomb,
//   Kyubanbomb,
//   Quickbomb,
//   Curlingbomb,
//   Robotbomb,
//   Trap,
//   Sprinkler,
//   Poisonmist,
//   Pointsensor,
//   Splashshield,
//   Jumpbeacon,
//   Tansanbomb,
//   Ttorpedo,
// }

// enum Special {
//   Armor,
//   Missile,
//   Splashbomb_pitcher,
//   Kyubanbomb_pitcher,
//   Quickbomb_pitcher,
//   Curlingbomb_pitcher,
//   Robotbomb_pitcher,
//   Presser,
//   Jetpack,
//   Chakuchi,
//   Amefurashi,
//   Sphere,
//   Bubble,
//   Nicedama,
//   Ultrahanko,
// }
