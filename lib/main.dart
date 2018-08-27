import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  List<int> _numberSe = new List<int>();
  int _numSe = null;
  List<int> _numberEp = new List<int>();
  int _numEp = null;

  Widget buildCard(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: SafeArea(
      child: Card(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/silicon.jpg', fit: BoxFit.cover,),
            Divider(),
            /*ListTile(
              title: Text('Silicon Valley', style: new TextStyle(color: Colors.black26, fontSize: 16.0),),
              onTap: () => print('tapped'),
            )*/
            ExpansionTile(
              title: Text('Silicon Valley', style: new TextStyle(color: Colors.black26, fontSize: 16.0),),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Season:'),
                      new DropdownButton<int>(
                        value: _numSe,
                        items: _numberSe.map((int value){
                          return new DropdownMenuItem(value: value, child: new Row(
                            children: <Widget>[
                              new Text('$value')
                            ],
                          ),);
                        }).toList(),
                        onChanged: (int value){_onChangedSe(value);},
                        //value: _season,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Episode:'),
                      new DropdownButton<int>(
                        value: _numEp,
                        items: _numberEp.map((int value){
                          return new DropdownMenuItem(value: value, child: new Row(
                            children: <Widget>[
                              new Text('$value')
                            ],
                          ),);
                        }).toList(),
                        onChanged: (int value){_onChangedEp(value);},
                        //value: _season,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Series Tracker'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(8.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              buildCard(context),
            ],
          ),
        ),

      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: null),
    );
  }

  @override
  void initState() {
    _numberSe.addAll([1, 2, 3, 4, 5]);
    _numSe = _numberSe.elementAt(0);
    _numberEp.addAll([1, 2, 3, 4, 5]);
    _numEp = _numberEp.elementAt(0);
  }

  void _onChangedSe(int newValue) {
  setState(() {
  _numSe = newValue;
  });
  }

  void _onChangedEp(int newValue) {
    setState(() {
      _numEp = newValue;
    });
  }

}