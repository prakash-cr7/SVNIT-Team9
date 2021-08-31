import 'package:dio/dio.dart';

class Data {
  List? allStockLatestData;

  Future<List> getLatestData() async {
    var response =
        await Dio().get('https://api-for-hackathon.herokuapp.com/ohlc-latest/');
    return response.data();
  }
}
