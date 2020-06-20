import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splatoon_weapon_roulette/Player/Player.dart';
import 'package:splatoon_weapon_roulette/Player/Players.dart';

class SettingPage extends StatelessWidget {
  final Player player;
  SettingPage({this.player});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Navigator'),
          ),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Sub'),
                  RaisedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('戻る'),
                  ),
                  makeMainCheckList(context)
                ],
              ),
            ),
          ),
        );
  }

  Widget makeMainCheckList(BuildContext context) {
    var index = 0;

    final name = player.name;
        //context.select((Players players) => players.getByIndex(index).name);
    return Text(name);
  }
}
