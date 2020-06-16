import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:splatoon_weapon_roulette/Tag/Tag.dart';
import 'Player/Players.dart';

//List<Player> players = new List(4);
//List<Tag> tags = new List<Tag>(4);
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
