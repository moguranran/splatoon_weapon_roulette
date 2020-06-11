import 'package:flutter/material.dart';
import 'package:splatoon_weapon_roulette/Player/Player.dart';

class Tag {
  int _container_cnt = 4;
  List<bool> _locks = [false, false, false, false];

  Container changeContainer() {
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
        container = _makeTagFour();
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

  Container _makeTagFour() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                Text('player1'),
                IconButton(
                  icon: new Icon(_locks[0] ? Icons.lock : Icons.lock_open),
                  onPressed: () => _lockStateChange(0),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    ));
  }

  void _lockStateChange(int index) {
      _locks[index] = !_locks[index];
  }

  
}
