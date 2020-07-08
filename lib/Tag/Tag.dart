import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:splatoon_weapon_roulette/Player/Players.dart';
import 'package:splatoon_weapon_roulette/Tag/SettingPage.dart';
import 'package:splatoon_weapon_roulette/Weapon/Weapon.dart';
import 'package:splatoon_weapon_roulette/presentation/custom_icon_icons.dart';

class Tag extends StatelessWidget {
  final Color _commonWhite = Color.fromARGB(200, 219, 255, 213);
  final List<String> _tagImage = [
    'assets/tag/tag_b.png',
    'assets/tag/tag_g.png',
    'assets/tag/tag_p.png',
    'assets/tag/tag_y.png'
  ];
  @override
  Widget build(BuildContext context) {
    return (ChangeNotifierProvider(
        create: (context) => Players(),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background_high.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    makeTag(context, 0),
                    makeTag(context, 1),
                    makeTag(context, 2),
                    makeTag(context, 3),
                    makeBottom(context)
                  ],
                ),
              ),
            ],
          ),
          resizeToAvoidBottomPadding: false,
        )));
  }

  Widget makeTag(BuildContext context, int index) {
    final name =
        context.select((Players players) => players.getByIndex(index).name);
    final lock =
        context.select((Players players) => players.getByIndex(index).isLocked);
    final weapon =
        context.select((Players players) => players.getByIndex(index).weapon) ??
            Weapon(name: 'splatoon');

    return (Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(_tagImage[index]), fit: BoxFit.fill)),
            margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: makeNameField(context, name, index),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                            //color: Colors.white30,
                            ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: <Widget>[
                            makeLockIcon(context, lock, index),
                            makeSettingsIcon(context, index)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    children: <Widget>[
                      makeWeaponSlot(context, weapon),
                      makeWeaponNameField(context, weapon, index),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget makeNameField(BuildContext context, String name, int index) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/tag/tag__name.png'),
        fit: BoxFit.fill,
      )),
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Container(
        child: TextFormField(
            enabled: true,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 1,
            maxLength: 10,
            initialValue: name,
            decoration:
                InputDecoration(counterText: '', border: InputBorder.none),
            onFieldSubmitted: (text) => {
                  context.read<Players>().getByIndex(index).changeName(text),
                  SystemChrome.restoreSystemUIOverlays()
                }),
      ),
    );
  }

  Widget makeLockIcon(BuildContext context, bool lock, int index) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/tag/tag__icon.png'),
      )),
      child: IconButton(
        icon: Icon(
          lock ? Icons.lock : Icons.lock_open,
          color: _commonWhite,
        ),
        onPressed: () => context.read<Players>().changeLocked(index),
      ),
    );
  }

  Widget makeSettingsIcon(BuildContext context, int index) {
    final player =
        context.select((Players players) => players.getByIndex(index));

    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/tag/tag__icon.png'))),
      child: IconButton(
          icon: Icon(
            Icons.settings,
            color: _commonWhite,
          ),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SettingPage(
                  player: player)))),
    );
  }

  Widget makeWeaponSlot(BuildContext context, Weapon weapon) {
    return Expanded(
      flex: 3,
      child: Container(
          padding: EdgeInsets.all(5),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/tag/tag__weapon.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: weapon.imagePath != null
                            ? AssetImage(weapon.imagePath)
                            : AssetImage('assets/tag/tag__weapon.png'),
                        fit: BoxFit.fill)),
              ),
            ],
          )),
    );
  }

  Widget makeWeaponNameField(BuildContext context, Weapon weapon, int index) {
    return Expanded(
      flex: 4,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/tag/tag__weaponname.png'),
                  fit: BoxFit.fill)),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: SizedBox.expand(
              child: InkWell(
                  onTap: () => context.read<Players>().roulette(index),
                  child: Center(
                    child: AutoSizeText(
                      weapon.name,
                      style: TextStyle(
                        color: _commonWhite,
                      ),
                      textAlign: TextAlign.center,
                      minFontSize: 20,
                      maxLines: 2,
                    ),
                  )))),
    );
  }

  //TODO:ボトムナビゲーションバーの透過
  Widget makeBottom(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: _commonWhite,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: null),
              Text(
                '追加',
                style: TextStyle(color: _commonWhite),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    CustomIcon.roulette_start,
                    color: Colors.orange,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () => context.read<Players>().rouletteAll(),),
              Text(
                'ルーレット',
                style: TextStyle(color: _commonWhite),
              )
            ],
          )
        ],
      ),
    );
  }
}
