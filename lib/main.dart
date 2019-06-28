import 'package:flutter/material.dart';

import 'blocs/bloc_provider.dart';
import 'blocs/counter_bloc.dart';
import 'package:stream_demo/SubPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          child: MyHomePage(title: 'Flutter Demo Home Page'),
          blocs: [CounterBloc()]),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    BlocProvider.of<CounterBloc>(context).first.increment(_counter);
  }

  @override
  void initState() {
    BlocProvider.of<CounterBloc>(context).first.counter.listen((_count) {
      setState(() {
        _counter = _count;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            OutlineButton(
              child: Text("点我进入nfc页面"),
              onPressed: ()=>Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new MyApp()),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
//        onPressed: () {
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new NFCReader()),
//          );
//        },
        tooltip: 'Increment',
        child: Icon(Icons.add),

      ),
    );
  }
}