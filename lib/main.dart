import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'allen test flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MWidget('Hello EveryBody!'),
    );
  }
}

class MWidget extends StatelessWidget {
  String title;

  MWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        titleMethod(context),
        resultMethod(context),
        keyboardMethod(context),
      ],
    );
  }

  Container resultWidget;
  Container titleWidget;

  titleMethod(context) {
    return titleWidget = Container(
      height: 100,
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Color.fromARGB(255, 255, 127, 127),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
      ),
    );
  }

  resultMethod(context) {
    return resultWidget = new Container(
      child: Text(
        'hh',
        style: TextStyle(decoration: TextDecoration.none),
      ),
      color: Color.fromARGB(255, 255, 255, 255),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomRight,
      height: 100,
    );
  }

  keyboardMethod(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
      height: MediaQuery.of(context).size.height - 100 - 100 - 20 - 2,
      color: Color(0xffffffff),
      child: Column(
        children: <Widget>[
          RowText(<String>['7', '8', '9', '*']),
          RowText(<String>['4', '5', '6', '-']),
          RowText(<String>['1', '2', '3', '+']),
          RowText(<String>['.', '/', ' ', '=']),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}

class NumberText extends GestureDetector {
  NumberText(String data)
      : super(
            child: Text(
              data,
              textAlign: TextAlign.left,
              style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xff007766),
              ),),
            onTap:()=>{
              showDialog<Null>(context:null,
                builder: (context){
                return AlertDialog(title:Text(data),);
                }

              )
            },

  );
}

class RowText extends Row {
  List<Widget> childWegit = new List<Widget>();

  RowText(List<String> numbers)
      : super(
          children: getWegit(numbers),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
        );

  static List<Widget> getWegit(List<String> numbers) {
    List<Widget> childWegits = new List<Widget>();
    for (var item in numbers) {
      childWegits.add(NumberText(item));
    }
    return childWegits;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'text',
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
