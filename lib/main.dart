import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splatoon_weapon_roulette/Player/player.dart';
import 'package:splatoon_weapon_roulette/Tag/Tag.dart';
import 'package:splatoon_weapon_roulette/Weapon/Weapon.dart';
import 'package:auto_size_text/auto_size_text.dart';

List<Player> players = List(4);
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  waitSetup();
  runApp(MyApp());
}

dynamic init() {
  players[0] = new Player('プレイヤー1', languages[8]);
  players[1] = new Player('プレイヤー2', languages[0]);
  players[2] = new Player('プレイヤー3', languages[1]);
  players[3] = new Player('プレイヤー4', languages[3]);
}

void waitSetup() {
  print('waiting...${players[0].weapons.length}');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Weapon _weapon;
  int _cnt = 0;
  Tag tag = new Tag();

  void _showWeapon() {
    setState(() {
      _weapon = players[_cnt].weapons[_counter];
      _counter++;
      if (_counter == players[0].weapons.length) _counter = 0;
    });
  }

  void _openSettings() {
    _counter = 0;
    _cnt++;
    if (_cnt > players.length) _cnt = 0;
    _showWeapon();
  }

  Text _getWeaponName() {
    if (players[0].weapons.length == 0 || _weapon == null)
      return Text('ここにブキ名が表示されます');

    if (players[0].weapons[_counter].mainWeapon == 'シューター') {
      return new Text('${_weapon.name} シューター');
    }

    return Text('${_weapon.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _openSettings,
        ),
        title: Text(widget.title),
      ),
      body: makeSlot(),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('追加')),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('まとめ')),
      ]),
    );
  }

  bool _lock = false;

  Container makeSlot() {
    //return tag.changeContainer();
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: IconButton(
                    padding: EdgeInsets.only(left: 10.0),
                    icon: Icon(_lock ? Icons.lock : Icons.lock_open),
                    iconSize: 40.0,
                    onPressed: _lockStateChange,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AutoSizeText(
                    '哲学するもぐら',
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    padding: EdgeInsets.only(right: 10.0),
                    icon: Icon(Icons.settings),
                    iconSize: 40.0,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    ));
  }

  void _lockStateChange() {
    setState(() {
      _lock = !_lock;
    });
    print(_lock);
  }
}
