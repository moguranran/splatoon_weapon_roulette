import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splatoon_weapon_roulette/Player/player.dart';
import 'package:splatoon_weapon_roulette/Tag/Tag.dart';
import 'package:splatoon_weapon_roulette/Weapon/Weapon.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

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
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _openSettings,
        ),
        title: Text(widget.title),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //       _getWeaponName(),
      //       Container(
      //         color: Colors.blue,
      //         width: 300.0,
      //         height: 300.0,
      //         child: Icon(
      //           Icons.menu,
      //           size: 50.0,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: makeSlot(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showWeapon,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Container makeSlot() {
    return tag.changeContainer();
  }
}
