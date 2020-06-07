class Weapon {
  final String name;
  final String mainWeapon;
  final String subWeapon;
  final String special;

  Weapon({this.name, this.mainWeapon, this.subWeapon, this.special});

  factory Weapon.fromJson(Map<String, dynamic> json){
    return new Weapon(
      name: json['name']['ja_JP'],
      mainWeapon: json['type']['name']['ja_JP'],
      subWeapon: json['sub']['name']['ja_JP'],
      special: json['special']['name']['ja_JP'],
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
