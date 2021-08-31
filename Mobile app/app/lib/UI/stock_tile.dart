import 'dart:math';

import 'package:app/UI/constans.dart';
import 'package:app/UI/stock_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockTile extends StatelessWidget {
  const StockTile({Key? key}) : super(key: key);

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
          'A',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: UiColors.avatarBgColor[Random().nextInt(6)],
      ),
      title: Text(
        'Apple',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'APPL',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("\$153"),
          Text(
            '+2.31%',
            style: TextStyle(color: Colors.green),
          )
        ],
      ),
    );
  }
}
