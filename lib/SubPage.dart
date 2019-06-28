import 'package:flutter/material.dart';

import 'blocs/bloc_provider.dart';
import 'blocs/nfc_bloc.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
class MyApp extends StatelessWidget {
  static const String sName = '/';
  MyApp(){
    print("create myapp");
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          child: AppPage(title: 'sub page'),
          blocs: [NfcBloc()]),
    );
  }
}

class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  NfcData _nfcData;

//  void _incrementCounter() {
//    BlocProvider.of<NfcBloc>(context).first.increment(_nfcData);
//  }

  @override
  void initState() {
    _nfcData = new NfcData();
//    BlocProvider.of<NfcBloc>(context).first.nfcData.listen((response) {
//      print("read nfc");
//      setState(() {
//        _nfcData =  response;
//      });
//    });
    startNFC();
    super.initState();
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
    stopNFC();
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
              onPressed: ()=>Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new MyApp()),
              ),
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

  Future<void> startNFC() async {
    setState(() {
      _nfcData = NfcData();
      _nfcData.status = NFCStatus.reading;
    });

    print('NFC: Scan started');

    print('NFC: Scan readed NFC tag');
    FlutterNfcReader.read.listen((response) {
      setState(() {
        _nfcData = response;
      });
    },onError: (error)=>print(error),onDone: ()=>print("on done"));
  }

  Future<void> stopNFC() async {
    NfcData response;

    try {
      print('NFC: Stop scan by user');
      response = await FlutterNfcReader.stop;
      print("stop success "+response.status.toString());
    } on Exception {
      print('NFC: Stop scan exception');
      response = NfcData(
        id: '',
        content: '',
        error: 'NFC scan stop exception',
        statusMapper: '',
      );
      response.status = NFCStatus.error;
    }
  }
}
