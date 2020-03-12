import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List currencies;
  List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text('Crypto'))
      ),
      body: _cryptoWidget(context),
    );
  }

  Widget _cryptoWidget(BuildContext context){
    return new Container(
      child: Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
                itemCount: widget.currencies.length,
                itemBuilder: (BuildContext context, int index){
                  Map currency = widget.currencies[index];
                  MaterialColor color = _colors[index%_colors.length];
                  return _getListItemUi(currency, color, context);
                }),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color, BuildContext context){
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency['name'][0],style: TextStyle(fontSize: 20)),
      ),
      title: new Text(currency["name"], style: new TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(currency["price_usd"], currency["percent_change_1h"]),
      isThreeLine: true,
      enabled: true,
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) {

          return Column(

            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.all(10)),
                      new Text(currency["name"], style: new TextStyle(fontSize: 40),textAlign: TextAlign.center),
                      new Padding(padding: EdgeInsets.all(10)),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        child: new Text(currency['rank'], style: new TextStyle(fontWeight: FontWeight.bold),),
                      )
                    ],
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('Last 1 Hour', style: new TextStyle(fontSize: 20, color: Colors.black54),),
                      new Padding(padding: EdgeInsets.all(10)),
                      new Text('Last 24 Hour', style: new TextStyle(fontSize: 20, color: Colors.black54),),
                      new Padding(padding: EdgeInsets.all(10)),
                      new Text('Last 7 Days', style: new TextStyle(fontSize: 20, color: Colors.black54),),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(10)),
                  new Padding(padding: EdgeInsets.all(10)),
                  new Column(
                    children: <Widget>[
                      (double.parse(currency["percent_change_1h"])>0)? Icon(Icons.arrow_upward, color: Colors.green) : Icon(Icons.arrow_downward, color: Colors.red),
                      new Padding(padding: EdgeInsets.all(10)),
                      (double.parse(currency["percent_change_24h"])>0)? Icon(Icons.arrow_upward, color: Colors.green) : Icon(Icons.arrow_downward, color: Colors.red),
                      new Padding(padding: EdgeInsets.all(10)),
                      (double.parse(currency["percent_change_7d"])>0)? Icon(Icons.arrow_upward, color: Colors.green) : Icon(Icons.arrow_downward, color: Colors.red),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(10)),
                  new Padding(padding: EdgeInsets.all(10)),
                  new Column(
                    children: <Widget>[
                      (double.parse(currency["percent_change_1h"])>0)? new Text(currency["percent_change_1h"]+'%', style: new TextStyle(fontSize: 20, color: Colors.green),) : new Text(currency["percent_change_1h"]+"%", style: new TextStyle(fontSize: 20, color: Colors.red),),
                      new Padding(padding: EdgeInsets.all(10)),
                      (double.parse(currency["percent_change_24h"])>0)? new Text(currency["percent_change_24h"]+'%', style: new TextStyle(fontSize: 20, color: Colors.green),) : new Text(currency["percent_change_24h"]+"%", style: new TextStyle(fontSize: 20, color: Colors.red),),
                      new Padding(padding: EdgeInsets.all(10)),
                      (double.parse(currency["percent_change_7d"])>0)? new Text(currency["percent_change_7d"]+'%', style: new TextStyle(fontSize: 20, color: Colors.green),) : new Text(currency["percent_change_7d"]+"%", style: new TextStyle(fontSize: 20, color: Colors.red),),
                    ],
                  )
                ],
              ),
//
//              new Column(
//                children: <Widget>[
//                  new Row(
//                    children: <Widget>[
//                      new Padding(padding: EdgeInsets.all(10)),
//                      new Text('Last 1 Hour', style: new TextStyle(fontSize: 20, color: Colors.black54),),
//                      new Padding(padding: EdgeInsets.all(10)),
//                      (double.parse(currency["percent_change_1h"])>0)? Icon(Icons.arrow_upward, color: Colors.green) : Icon(Icons.arrow_downward, color: Colors.red),
//                      new Padding(padding: EdgeInsets.all(10)),
//                      (double.parse(currency["percent_change_1h"])>0)? new Text(currency["percent_change_1h"]+'%', style: new TextStyle(fontSize: 30, color: Colors.green),) : new Text(currency["percent_change_1h"], style: new TextStyle(fontSize: 30, color: Colors.red),),
//                      new Padding(padding: EdgeInsets.all(10))
//                    ],
//                    mainAxisAlignment: MainAxisAlignment.center,
//                  ),
//                  new Row(
//                    children: <Widget>[
//                      new Padding(padding: EdgeInsets.all(10)),
//                      new Text('Last 24 Hours', style: new TextStyle(fontSize: 20, color: Colors.black54),),
//                      new Padding(padding: EdgeInsets.all(10)),
//                      (double.parse(currency["percent_change_24h"])>0)? Icon(Icons.arrow_upward, color: Colors.green) : Icon(Icons.arrow_downward, color: Colors.red),
//                      new Padding(padding: EdgeInsets.all(10)),
//                      (double.parse(currency["percent_change_24h"])>0)? new Text(currency["percent_change_24h"]+'%', style: new TextStyle(fontSize: 30, color: Colors.green),) : new Text(currency["percent_change_1h"], style: new TextStyle(fontSize: 30, color: Colors.red),),
//                      new Padding(padding: EdgeInsets.all(10))
//                    ],
//                    mainAxisAlignment: MainAxisAlignment.center,
//                  ),
//                  new Row(
//                    children: <Widget>[
//                      new Padding(padding: EdgeInsets.all(10)),
//                      new Text('Last 7 Days', style: new TextStyle(fontSize: 20, color: Colors.black54),),
//                      new Padding(padding: EdgeInsets.all(10)),
//                      (double.parse(currency["percent_change_7d"])>0)? Icon(Icons.arrow_upward, color: Colors.green) : Icon(Icons.arrow_downward, color: Colors.red),
//                      new Padding(padding: EdgeInsets.all(10)),
//                      (double.parse(currency["percent_change_7d"])>0)? new Text(currency["percent_change_7d"]+'%', style: new TextStyle(fontSize: 30, color: Colors.green),) : new Text(currency["percent_change_1h"], style: new TextStyle(fontSize: 30, color: Colors.red),),
//                      new Padding(padding: EdgeInsets.all(10))
//                    ],
//                    mainAxisAlignment: MainAxisAlignment.center,
//                  )
//                ],
//              )
            ],
          );
        });
      },
    );
  }

  void _getDescription(Map currency){

  }

  Widget _getSubtitleText(String priceUSD, String percentChange){
    TextSpan priceTextWidget = new TextSpan(text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour $percentChange%";
    TextSpan percentageChangeTextWidget;

    if(double.parse(percentChange) > 0){
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText, style: new TextStyle(color: Colors.green));
    }
    else{
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }
    return new RichText(
        text: new TextSpan(
          children: [priceTextWidget,percentageChangeTextWidget]
        )
    );
  }
}

