import 'package:app/UI/search_box.dart';
import 'package:app/UI/stock_tile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trade',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(primaryColor: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Trade'),
          backgroundColor: Colors.black87,
          centerTitle: true,
          elevation: 2,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SearchBox(),
            ),
            SizedBox(
              height: 10,
            ),
            StockTile(),
            StockTile(),
            StockTile(),
            StockTile(),
            StockTile(),
            StockTile(),
            StockTile(),
          ],
        ),
      ),
    );
  }
}
