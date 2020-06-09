import 'package:flutter/material.dart';

class Tag {
  int _container_cnt = 1;

  Container changeContainer() {
    Container container = null;
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

    _container_cnt++;
    if (_container_cnt > 4) _container_cnt = 1;

    return container;
  }

  Container _makeTagOne() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: 50,
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
        Container(
          color: Colors.yellow,
          width: 50,
          height: 50,
        ),
      ],
    ));
  }
}
