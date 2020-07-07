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
  List<String> weaponGenreTitle = ['メイン', 'サブ', 'スペシャル'];
  List<String> weaponGenreString = ['mainWeapon', 'subWeapon', 'specialWeapon'];
  List<Map<String, bool>> weaponGenre;
  List<Map<String, String>> weaponGenreName;

  _ChangeFormState(Player player) {
    this.player = player;
    weaponGenre = [player.mainWeapon, player.subWeapon, player.specialWeapon];
    weaponGenreName = [
      player.mainWeaponName,
      player.subWeaponName,
      player.specialWeaponName
    ];
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
              makeCheckList(context, 0),
              makeCheckList(context, 1),
              makeCheckList(context, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeCheckList(BuildContext context, int weaponIndex) {
    return Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
        child: ExpandableNotifier(
            child: ExpandablePanel(
                header: Text(weaponGenreTitle[weaponIndex]),
                expanded: ScrollOnExpand(
                    child: Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: weaponGenre[weaponIndex].length,
                    itemBuilder: (BuildContext context, int index) {
                      String key =
                          weaponGenre[weaponIndex].keys.elementAt(index);
                      String weaponTypeName = weaponGenreName[weaponIndex][key];
                      return CheckboxListTile(
                        activeColor: Colors.blue,
                        title: Text(weaponTypeName),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: weaponGenre[weaponIndex][key],
                        onChanged: (bool value) {
                          setState(() {
                            bool hasCandidate = player.changeState(
                                weaponGenreString[weaponIndex], key, value);
                            if (!hasCandidate)
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        content:
                                            Text('見つかりませんでした。\n条件を変更してください。'),
                                        actions: <Widget>[
                                          SimpleDialogOption(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ));
                          });
                        },
                      );
                    },
                  ),
                )))));
  }
}
