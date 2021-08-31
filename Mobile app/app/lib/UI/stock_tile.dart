import 'dart:math';

import 'package:app/UI/constans.dart';
import 'package:app/UI/stock_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockTile extends StatelessWidget {
  final String ukey;
  final String name;
  final double price;
  final double change;

  const StockTile(
      {Key? key,
      required this.ukey,
      required this.price,
      required this.change,
      this.name = 'Apple'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => StockDetail()));
      },
      dense: false,
      leading: CircleAvatar(
        child: Text(
          ukey[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: UiColors.avatarBgColor[Random().nextInt(6)],
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        ukey,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("\$${price.toString()}"),
          Text(
            change > 0
                ? '+${change.toStringAsFixed(2)}%'
                : '-${change.toStringAsFixed(2)}%',
            style: TextStyle(color: change > 0 ? Colors.green : Colors.red),
          )
        ],
      ),
    );
  }
}
