import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splatoon_weapon_roulette/Player/Player.dart';
import 'package:splatoon_weapon_roulette/Tag/Tag.dart';
import 'package:splatoon_weapon_roulette/Weapon/Weapon.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'Player/Players.dart';

//List<Player> players = new List(4);
//List<Tag> tags = new List<Tag>(4);
final List<String> languages = [
  'de_DE',
  'en_GB',
  'en_US',
  'es_ES',
  'es_MX',
  'fr_CA',
  'fr_FR',
  'it_IT',
  'ja_JP',
  'nl_NL',
  'ru_RU'
];
Players players;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPlayers();
  await initTags();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

dynamic initPlayers() {
  players = Players();
  // players[0] = new Player('プレイヤー1', languages[8]);
  // players[1] = new Player('プレイヤー2', languages[0]);
  // players[2] = new Player('プレイヤー3', languages[1]);
  // players[3] = new Player('プレイヤー4', languages[3]);
}

dynamic initTags() {
  // tags[0] = new Tag(players[0]);
  // tags[1] = new Tag(players[1]);
  // tags[2] = new Tag(players[2]);
  // tags[3] = new Tag(players[3]);
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Splatton2 Roulette'),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  // final player = Player();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => players,
        child: Tag(),
      ),      
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   Weapon _weapon;
//   int _cnt = 0;

//   void _showWeapon() {
//     setState(() {
//       _weapon = players[_cnt].weapons[_counter];
//       _counter++;
//       if (_counter == players[0].weapons.length) _counter = 0;
//     });
//   }

//   void _openSettings() {
//     _counter = 0;
//     _cnt++;
//     if (_cnt > players.length) _cnt = 0;
//     _showWeapon();
//   }

//   Text _getWeaponName() {
//     if (players[0].weapons.length == 0 || _weapon == null)
//       return Text('ここにブキ名が表示されます');

//     if (players[0].weapons[_counter].mainWeapon == 'シューター') {
//       return new Text('${_weapon.name} シューター');
//     }

//     return Text('${_weapon.name}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/background.png'),
//                     fit: BoxFit.cover)),
//           ),
//           makeSlot(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('追加')),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('まとめ')),
//       ]),
//     );
//   }

//   bool _lock = false;

//   Container makeSlot() {
//     //return tag.changeContainer(_lockStateChange);
//     return Container(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         //tags[0].build(context),
//         Expanded(
//             child: Stack(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/tag/tag_b.png'),
//                       fit: BoxFit.fill)),
//               margin: EdgeInsets.all(5),
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                     flex: 3,
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           flex: 5,
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image:
//                                         AssetImage('assets/tag/tag__name.png'),
//                                     fit: BoxFit.fill)),
//                             margin: EdgeInsets.all(5),
//                             padding: EdgeInsets.all(3),
//                             child: SizedBox.expand(
//                               child: AutoSizeText(
//                                 '${players[1].name}',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 20),
//                                 textAlign: TextAlign.center,
//                                 //maxLines: 1,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 3,
//                           child: Container(
//                               // color: Colors.white30,
//                               ),
//                         ),
//                         Expanded(
//                           flex: 4,
//                           child: Row(
//                             children: <Widget>[
//                               Container(
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                   image: AssetImage('assets/tag/tag__icon.png'),
//                                 )),
//                                 margin: EdgeInsets.all(4),
//                                 child: IconButton(
//                                   icon: Icon(
//                                     players[1].isLocked
//                                         ? Icons.lock
//                                         : Icons.lock_open,
//                                     color: Color.fromARGB(200, 219, 255, 213),
//                                   ),
//                                   onPressed: () => _lockStateChange(players[1]),
//                                 ),
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         image: AssetImage(
//                                             'assets/tag/tag__icon.png'))),
//                                 margin: EdgeInsets.all(4),
//                                 child: IconButton(
//                                     icon: Icon(
//                                       Icons.settings,
//                                       color: Color.fromARGB(200, 219, 255, 213),
//                                     ),
//                                     onPressed: () {}),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     flex: 5,
//                     child: Row(
//                       children: <Widget>[
//                         Container(
//                           color: Colors.white,
//                           width: 150,
//                         ),
//                         Expanded(
//                           child: AutoSizeText(
//                             '${players[0].language}',
//                             minFontSize: 14,
//                             maxLines: 2,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         )),
//         //_space(),
//         // Expanded(
//         //   child: Container(
//         //     color: Colors.green,
//         //   ),
//         // ),
//         //tags[2].build(context),
//         Expanded(
//           child: Container(
//             color: Colors.yellow,
//           ),
//         ),
//       ],
//     ));
//   }

//   void _lockStateChange(Player player) {
//     setState(() {
//       //player.isLocked = !player.isLocked;
//       //players[0].isLocked = !players[0].isLocked;
//     });
//     print(player.isLocked);
//   }

//   Container _space() {
//     return Container(
//       color: Colors.black,
//       height: 5,
//     );
//   }
// }
