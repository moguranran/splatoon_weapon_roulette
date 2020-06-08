import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splatoon_weapon_roulette/Player/player.dart';
import 'package:splatoon_weapon_roulette/Weapon/Weapon.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
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
  List<Weapon> _weapons = [];
  Weapon _weapon = null;
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
  int _cnt = 0;
  String language = 'ja_JP';
  List<Player> players = List(4);

  void _makeWeaponList(List<Weapon> list){
    // _weapons = [];
    // String _loadData = await rootBundle.loadString('assets/weapon.json');
    // List js = await jsonDecode(_loadData);
    // js.forEach((key) {
    //   Weapon weapon = Weapon.fromJson(key, language: language);
    //   //list.add(weapon);
    //   _weapons.add(weapon);
    // });

    // for (var key in js) {
    //   Weapon weapon = Weapon.fromJson(key, language: language);
    //   _weapons.add(weapon);
    // }
    //players.add(new Player('プレイヤー1', language));
    players[0] = new Player('プレイヤー1', language);
    print(players[0].weapons.length);
  }

  void _showWeapon() {
    setState(() {
      _weapon = players[0].weapons[_counter];
      _counter++;
      if (_counter > players[0].weapons.length) _counter = 0;
    });
  }

  void _openSettings() {
    _counter = 0;
    _cnt++;
    if (_cnt > languages.length) _cnt = 0;
    language = languages[_cnt];
    _showWeapon();
  }

  Text _getWeaponName() {
    if (players[0].weapons.length == 0) return Text('ここにブキ名が表示されます');

    if (players[0].weapons[_counter].mainWeapon == 'シューター') {
      return new Text('${_weapon.name} シューター');
    }

    return Text('${_weapon.name}');
  }

  @override
  Widget build(BuildContext context) {
    _makeWeaponList(_weapons);
    //ToDo
    //チョイス用チェックリストを作る

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _openSettings,
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            _getWeaponName(),
            //Text('${_weapon.name}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showWeapon,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
