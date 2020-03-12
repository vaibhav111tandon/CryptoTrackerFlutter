import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'home_page.dart';
void main() async {
  final List currencies = await getCurrencies();
  runApp(new MyApp(currencies));

}

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: new HomePage(_currencies),
    );
  }
}
Future<List> getCurrencies() async {
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=100";
  http.Response response = await http.get(cryptoUrl);
  return json.decode(response.body);
}
