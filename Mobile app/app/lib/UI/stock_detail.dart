import 'dart:math';

import 'package:app/UI/constans.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockDetail extends StatefulWidget {
  @override
  _StockDetailState createState() => _StockDetailState();
}

class _StockDetailState extends State<StockDetail> {
  List<Candle> candles = [];
  String _currentChart = 'L';
  String _selectedChip = '1D';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$251',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 26)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: _currentChart == 'C'
                                ? MaterialStateProperty.all<Color>(
                                    UiColors.primaryColor)
                                : null,
                          ),
                          onPressed: () {
                            setState(() {
                              _currentChart = 'C';
                            });
                          },
                          child: Text(
                            'C',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: _currentChart == 'L'
                                ? MaterialStateProperty.all<Color>(
                                    UiColors.primaryColor)
                                : null,
                          ),
                          onPressed: () {
                            setState(() {
                              _currentChart = 'L';
                            });
                          },
                          child: Text(
                            'L',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
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
                child: _currentChart == 'C'
                    ? Candlesticks(
                        candles: candles,
                        onIntervalChange: (data) async {},
                        interval: "1d")
                    : SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <LineSeries<StockData, String>>[
                            LineSeries<StockData, String>(
                                // Bind data source
                                dataSource: <StockData>[
                                  StockData('1', 35.0),
                                  StockData('2', 28),
                                  StockData('3', 34),
                                  StockData('4', 32),
                                  StockData('5', 40)
                                ],
                                xValueMapper: (StockData stock, _) =>
                                    stock.time,
                                yValueMapper: (StockData sales, _) =>
                                    sales.price)
                          ]),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedChip = '1D';
                      });
                    },
                    child: Chip(
                      label: Text('1D'),
                      backgroundColor:
                          _selectedChip == '1D' ? UiColors.primaryColor : null,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedChip = '1W';
                      });
                    },
                    child: Chip(
                      label: Text('1W'),
                      backgroundColor:
                          _selectedChip == '1W' ? UiColors.primaryColor : null,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedChip = '1M';
                      });
                    },
                    child: Chip(
                      label: Text('1M'),
                      backgroundColor:
                          _selectedChip == '1M' ? UiColors.primaryColor : null,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedChip = 'ALL';
                      });
                    },
                    child: Chip(
                      label: Text('ALL'),
                      backgroundColor:
                          _selectedChip == 'ALL' ? UiColors.primaryColor : null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'About Apple inc',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Apple, Inc. engages in the design, manufacture, and marketing of mobile communication, media devices, personal computers, and portable digital music players. It operates through the following geographical segments: Americas, Europe, Greater China, Japan, and Rest of Asia Pacific. The Americas segment includes North and South America. The Europe segment consists of European countries, as well as India, the Middle East, and Africa. The Greater China segment comprises of China, Hong Kong, and Taiwan. The Rest of Asia Pacific segment includes Australia and Asian countries. The company was founded by Steven Paul Jobs, Ronald Gerald Wayne, and Stephen G. Wozniak on April 1, 1976 and is headquartered in Cupertino, CA.",
                style: TextStyle(color: Colors.grey[200], fontSize: 14),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StockData {
  final String? time;
  final double? price;

  StockData(this.time, this.price);
}
