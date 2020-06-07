import 'dart:convert';

import 'package:flutter/material.dart';
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
  final List<Weapon> _weapons = [];
  Weapon _weapon = null;

  void _makeWeaponList(List<Weapon> list) async {
    String _loadData = await rootBundle.loadString('assets/weapon.json');
    List js = await jsonDecode(_loadData);
    js.forEach((key) {
      Weapon weapon = Weapon.fromJson(key);
      list.add(weapon);
    });
  }

  void _showWeapon() {
    setState(() {
      _weapon = _weapons[_counter];
      _counter++;
      if (_counter > _weapons.length) _counter = 0;
    });
  }

  Text _getWeaponName() {
    if (_weapons.length == 0) return Text('ここにブキ名が表示されます');
    
    if(_weapon.mainWeapon == 'シューター'){
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
