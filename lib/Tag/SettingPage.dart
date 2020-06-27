import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splatoon_weapon_roulette/Player/Player.dart';
import 'package:expandable/expandable.dart';

class SettingPage extends StatefulWidget {
  final Player player;
  SettingPage({this.player});
  @override
  State<StatefulWidget> createState() => _ChangeFormState(player);
}

class _ChangeFormState extends State<SettingPage> {
  Player player;

  _ChangeFormState(Player player) {
    this.player = player;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ルーレットの条件'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              makeMainCheckList(context),
              makeSubCheckList(context),
              makeSpecialCheckList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeMainCheckList(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
        child: ExpandableNotifier(
            child: ExpandablePanel(
                header: Text('メイン'),
                expanded: ScrollOnExpand(
                    child: Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: player.mainWeapon.length,
                    itemBuilder: (BuildContext context, int index) {
                      String key = player.mainWeapon.keys.elementAt(index);
                      return CheckboxListTile(
                        activeColor: Colors.blue,
                        title: Text(key),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: player.mainWeapon[key],
                        onChanged: (bool value) {
                          setState(() {
                            player.changeWeaponsState('mainWeapon', key, value);
                          });
                        },
                      );
                    },
                  ),
                )))));
  }

  Widget makeSubCheckList(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
        child: ExpandableNotifier(
            child: ExpandablePanel(
                header: Text('サブ'),
                expanded: ScrollOnExpand(
                    child: Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: player.subWeapon.length,
                    itemBuilder: (BuildContext context, int index) {
                      String key = player.subWeapon.keys.elementAt(index);
                      return CheckboxListTile(
                        activeColor: Colors.orange,
                        title: Text(key),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: player.subWeapon[key],
                        onChanged: (bool value) {
                          setState(() {
                            player.changeWeaponsState('subWeapon', key, value);
                          });
                        },
                      );
                    },
                  ),
                )))));
  }

  Widget makeSpecialCheckList(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
        child: ExpandableNotifier(
            child: ExpandablePanel(
                header: Text('スペシャル'),
                expanded: ScrollOnExpand(
                  child: Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: player.specialWeapon.length,
                        itemBuilder: (BuildContext context, int index) {
                          String key =
                              player.specialWeapon.keys.elementAt(index);
                          return CheckboxListTile(
                            activeColor: Colors.pink,
                            title: Text(key),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: player.specialWeapon[key],
                            onChanged: (bool value) {
                              setState(() {
                                player.changeWeaponsState(
                                    'specialWeapon', key, value);
                              });
                            },
                          );
                        },
                      )),
                ))));
  }
}
