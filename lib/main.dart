import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:splatoon_weapon_roulette/Tag/Tag.dart';
import 'Player/Players.dart';

Players players;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  await initPlayers();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

dynamic initPlayers() {
  players = new Players();
}

class MyApp extends StatelessWidget {
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
