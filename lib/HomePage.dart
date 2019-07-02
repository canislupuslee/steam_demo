import 'package:flutter/material.dart';

import 'package:stream_demo/SubPage.dart';

class Home extends StatefulWidget {
  @override
  _AppState createState () => _AppState();
}

class _AppState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: const Text('home'),
          ),
          body: new SafeArea(
            top: true,
            bottom: true,
            child: new Center(
              child: ListView(
                children: <Widget>[
                  new SizedBox(
                    height: 10.0,
                  ),
                  new RaisedButton(
                    child: Text('Start NFC'),
                    onPressed: () {
//                      return MyApp();
                    },
                  ),

                ],
              ),
            ),
          )),
    );
  }
}
