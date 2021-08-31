import 'dart:convert';

import 'package:app/UI/search_box.dart';
import 'package:app/UI/stock_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trade',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(primaryColor: Colors.deepPurple, accentColor: Colors.black),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> tiles = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SearchBox(),
    ),
    SizedBox(
      height: 10,
    ),
  ];

  Future getLatestData() async {
    var response = await http
        .get(Uri.parse('https://api-for-hackathon.herokuapp.com/ohlc-latest/'));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Trade'),
          backgroundColor: Colors.black87,
          centerTitle: true,
          elevation: 2,
        ),
        body: FutureBuilder<dynamic>(
            future: getLatestData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                for (int i = 0; i < data.length; i++) {
                  double change = 100 *
                      (data[i]['close'].toDouble() -
                          data[i]['open'].toDouble()) /
                      data[i]['open'].toDouble();
                  StockTile tile = new StockTile(
                      ukey: data[i]['key'],
                      price: data[i]['close'].toDouble(),
                      change: change);
                  tiles.add(tile);
                }
              }
              return ListView.builder(
                  itemCount: tiles.length,
                  itemBuilder: (context, index) {
                    return tiles[index];
                  });
            }),
      ),
    );
  }
}
