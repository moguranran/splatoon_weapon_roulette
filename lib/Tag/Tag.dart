import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:splatoon_weapon_roulette/Player/Players.dart';
import 'package:splatoon_weapon_roulette/Weapon/Weapon.dart';

class Tag extends StatelessWidget {
  final Color _commonWhite = Color.fromARGB(200, 219, 255, 213);
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
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    make(context, 0),
                    make(context, 1),
                    make(context, 2),
                    make(context, 3),
                  ],
                ),
              ),
            ],
          ),
          resizeToAvoidBottomPadding: false,
        )));
  }

  Widget make(BuildContext context, int index) {
    final name =
        context.select((Players players) => players.getByIndex(index).name);
    final lock =
        context.select((Players players) => players.getByIndex(index).isLocked);
    final weapon = context
        .select((Players players) => players.getByIndex(index).weapons[0]);

    return (Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/tag/tag_b.png'),
                    fit: BoxFit.fill)),
            margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Container(
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
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              maxLength: 10,
                              initialValue: name,
                              decoration: InputDecoration(counterText: ''),
                              onFieldSubmitted: (text) => context
                                  .read<Players>()
                                  .getByIndex(index)
                                  .changeName(text),
                            ),
                          ),
                        ),
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
                            makeSettingsIcon(context)
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
                      makeWeaponNameField(context, weapon),
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
        onPressed: () => //player.changeLocked()
            context.read<Players>().changeLocked(index),
      ),
    );
  }

  Widget makeSettingsIcon(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/tag/tag__icon.png'))),
      child: IconButton(
          icon: Icon(
            Icons.settings,
            color: _commonWhite,
          ),
          onPressed: () {}),
    );
  }

  Widget makeWeaponSlot(BuildContext context, Weapon weapon) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.all(5),
        color: Colors.white,
      ),
    );
  }

  Widget makeWeaponNameField(BuildContext context, Weapon weapon) {
    return Expanded(
      flex: 4,
      child: Container(
          //color: Colors.white,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/tag/tag__weaponname.png'),
                  fit: BoxFit.fill)),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: SizedBox.expand(
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
          ))),
    );
  }
}
