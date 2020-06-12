import 'package:flutter/material.dart';
import 'package:splatoon_weapon_roulette/Player/Player.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Tag {
  int _container_cnt = 4;
  List<bool> _locks = [false, false, false, false];
  List players;
  int num=0;
  String step;

  Tag(this.players);

  Container changeContainer(void function()) {
    Container container;// = null;
    switch (_container_cnt) {
      case 1:
        container = _makeTagOne();
        break;
      case 2:
        container = _makeTagTwo();
        break;
      case 3:
        container = _makeTagThree();
        break;
      case 4:
        container = _makeTagFour(function);
        break;
      default:
    }

    //_container_cnt++;
    if (_container_cnt > 4) _container_cnt = 4;

    return container;
  }

  Container _makeTagOne() {
    return Container(
        color: Colors.greenAccent,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
            ),
          ],
        ));
  }

  Container _makeTagTwo() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 50,
          ),
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }

  Container _makeTagThree() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: 50,
        ),
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    ));
  }

  Container _makeTagFour(void function()) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: IconButton(
                    padding: EdgeInsets.only(left: 10.0),
                    icon: Icon(_locks[0] ? Icons.lock : Icons.lock_open),
                    iconSize: 40.0,
                    onPressed: function,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AutoSizeText(
                    '哲学するもぐら',
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    padding: EdgeInsets.only(right: 10.0),
                    icon: Icon(Icons.settings),
                    iconSize: 40.0,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
        _space(),
        Expanded(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: AutoSizeText(
                          '${players[1].name}',
                          minFontSize: 20,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: IconButton(
                                icon:
                                    Icon(_locks[1] ? Icons.lock : Icons.lock_open),
                                onPressed: function,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                  icon: Icon(Icons.settings), onPressed: () {}),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('..................................'),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        width: 150,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          '${players[0].language}',
                          minFontSize: 14,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        _space(),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        _space(),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    ));
  }

    Container _space(){
    return Container(color: Colors.black, height: 5,);
  }
}
