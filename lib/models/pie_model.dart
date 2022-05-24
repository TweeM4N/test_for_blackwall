import 'package:flutter/material.dart';

class PieModel {
  static List<Pie> pies = [
    Pie(name: 'Apple', percent: 30, color: Colors.green, symbol: 'AAPL'),
    Pie(name: 'Google', percent: 25, color: Colors.grey, symbol: 'GOOG'),
    Pie(name: 'Amazon', percent: 20, color: Colors.orange, symbol: 'AMZN'),
    Pie(
        name: 'Microsoft Corporation',
        percent: 15,
        color: Colors.pink,
        symbol: 'MSFT'),
    Pie(
        name: 'Meta Platforms Inc.',
        percent: 10,
        color: Colors.blue[900]!,
        symbol: 'FB'),
  ];
}

class Pie {
  final String name;
  final double percent;
  final Color color;
  final String symbol;

  Pie(
      {required this.name,
      required this.percent,
      required this.color,
      required this.symbol});
}
