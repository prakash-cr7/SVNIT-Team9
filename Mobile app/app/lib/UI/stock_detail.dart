import 'dart:math';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';

class StockDetail extends StatefulWidget {
  @override
  _StockDetailState createState() => _StockDetailState();
}

class _StockDetailState extends State<StockDetail> {
  List<Candle> candles = [];
  

  void addCandles() {
    for (int i = 0; i < 100; i++) {
      Candle candle = new Candle(
          date: DateTime.now().subtract(Duration(days: i)),
          high: Random().nextDouble(),
          low: Random().nextDouble(),
          open: Random().nextDouble(),
          close: Random().nextDouble(),
          volume: Random().nextDouble());
      candles.add(candle);
    }
  }

  @override
  void initState() {
    addCandles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apple inc price',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text('\$251',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 26)),
              SizedBox(
                height: 10,
              ),
              Text(
                '+\$1.01 (1.01%)',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Candlesticks(
                    candles: candles,
                    onIntervalChange: (data) async {},
                    interval: "1d"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
