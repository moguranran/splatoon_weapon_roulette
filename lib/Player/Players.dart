import 'Player.dart';
import 'package:flutter/foundation.dart';

class Players extends ChangeNotifier {
  List<Player> players;
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

  Players() {
    players = new List(4);
    players[0] = new Player('プレイヤー1', languages[8], 0);
    players[1] = new Player('プレイヤー2', languages[0], 1);
    players[2] = new Player('プレイヤー3', languages[1], 2);
    players[3] = new Player('プレイヤー4', languages[3], 3);
  }

  Player getByIndex(index) {
    for (var player in players) {
      if (player.index == index) return player;
    }

    return null;
  }

  void actionWithNotify(int index, Function function) {
    var player = getByIndex(index);
    if (player == null) return;

    function();
    notifyListeners();
  }

  void changeName(int index, String name) {
    var player = getByIndex(index);
    if (player == null) return;

    player.changeName(name);
    notifyListeners();
  }

  void changeLocked(int index) {
    var player = getByIndex(index);
    if (player == null) return;

    player.changeLocked();
    notifyListeners();
  }

  void roulette(int index) {}
}
