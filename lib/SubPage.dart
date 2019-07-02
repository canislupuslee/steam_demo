import 'package:flutter/material.dart';
import 'dart:async';

import 'blocs/bloc_provider.dart';
import 'blocs/nfc_bloc.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:stream_demo/util/constants.dart';

class MyApp extends StatelessWidget {
  static NfcData _nfcData;
  static const String sName = '/';
  MyApp(NfcData nfcData){
    print("create myapp");
    _nfcData = nfcData;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          child: AppPage(title: 'sub page',nfcData: _nfcData),
          blocs: [NfcBloc()]),
    );
  }
}

class AppPage extends StatefulWidget {
  AppPage({Key key, this.title,this.nfcData}) : super(key: key);

  final String title;
  final NfcData nfcData;

  @override
  _AppPageState createState() => _AppPageState(MyApp._nfcData);
}

class _AppPageState extends State<AppPage> {
  NfcData _nfcData;
  static NfcData nfcData2;

  _AppPageState(NfcData _nfcData){
    this._nfcData = _nfcData;
  }

  @override
  void initState() {
    super.initState();
    Constants.streamSubscription.onData(onData);
    Constants.nfdDataStreamSubscription.onData(onNfcData);
  }
  void onData(data){
    print("subPage ondata: $data");
  }

  void onNfcData(nfcData){
    setState(() {
      print("set...");
      _nfcData = nfcData;
      print("data :  ${_nfcData.id}");
    });
    print(nfcData.id);
  }

  @override
  void didUpdateWidget(AppPage oldWidget) {
    print("do didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void reassemble() {
    // TODO: implement reassemble
    print("do reassemble");
    super.reassemble();
  }
  @override
  void deactivate() {
    print("do deactivate");
//    stopNFC();
    super.deactivate();
  }
  void _onError(error){
    print(error);
  }

  @override
  void dispose() {
    print("do dispose");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading:true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'NFC',
            ),
            Text(
              'id:${_nfcData.id}',
              style: Theme.of(context).textTheme.display1,
            ),Text(
              'status:${_nfcData.status}',
              style: Theme.of(context).textTheme.display1,
            ),OutlineButton(
              child: Text("click me"),
//              onPressed: ()=>Navigator.push(
//                context,
//                new MaterialPageRoute(builder: (context) => new MyApp()),
//              ),
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),

    );
  }

}



