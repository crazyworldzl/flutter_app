import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

class MWidget extends StatefulWidget {
  String title;

  MWidget(this.title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MHome(title);
  }
}

class _MHome extends State<MWidget> {
  String title;
  static List<String> dd;
  static String lastSymbol = '';
  static int lastResult = 0;
  String resultString = '';
  String calculatorString = '';
  bool isReset = false;
  Container resultWidget;
  Container titleWidget;

  _MHome(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: <Widget>[
        titleMethod(context),
        calculatorMethod(),
        resultMethod(context),
        keyboardMethod(context),
      ],
    );
  }

  titleMethod(context) {
    return titleWidget = Container(
      height: 20,
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
        resultString,
        style: TextStyle(decoration: TextDecoration.none),
      ),
      color: Color.fromARGB(255, 255, 255, 255),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomRight,
      height: 100,
    );
  }

  calculatorMethod() {
    return new Container(
      child: Text(calculatorString,style: TextStyle(decoration: TextDecoration.none),),
      color: Color.fromARGB(255, 255, 255, 255),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomRight,
      height: 100,

    );
  }

  keyboardMethod(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
      height: MediaQuery.of(context).size.height - 100 - 100-20- 20 - 2,
      color: Color(0xffffffff),
      child: Column(
        children: <Widget>[
          RowText(<String>['7', '8', '9', '*'], _changeKey),
          RowText(<String>['4', '5', '6', '-'], _changeKey),
          RowText(<String>['1', '2', '3', '+'], _changeKey),
          RowText(<String>['.', '/', 'CE', '='], _changeKey),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }

  _changeKey(String data) {
    setState(() {
      print("zlmsg "+lastSymbol);
      if (isReset) {
        try {
          num.parse(data);
          resultString = '';
          calculatorString=data;
          isReset = false;
        } on Exception {
          resultString = '';
          isReset = true;
        }
        lastSymbol = '';
        calculatorString='';
        lastResult = 0;

      } else if (data == 'CE') {
        resultString = '';
        calculatorString='';
        lastSymbol = '';
        lastResult = 0;
        isReset = true;
      } else if (data == '=') {
        

      } else if (data == '+' || data == '-' || data == '*' || data == '/') {
        if(lastSymbol!=data) {
          if(lastSymbol==".")return;
          try {
            num.parse(lastSymbol);
            calculatorString = calculatorString + data;
          } on Exception {
           calculatorString =  calculatorString.replaceRange(
                calculatorString.length - 1, calculatorString.length, data);
          }
          print('zlmsg=3');
          lastSymbol = data;

        }
        
      } else if(data=='.'){
        if(lastSymbol!='.'){
          lastSymbol=data;
          calculatorString = calculatorString+data;
        }
      }else {
        lastSymbol=data;
        calculatorString = calculatorString+data;
      }
    });
  }
}

class NumberText extends GestureDetector {
  NumberText(String data, Function f)
      : super(
            child: Text(
              data,
              textAlign: TextAlign.left,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xff007766),
              ),
            ),
            onTap: () => {f(data)});
}

class RowText extends Row {
  List<Widget> childWegit = new List<Widget>();

  RowText(List<String> numbers, Function f)
      : super(
          children: getWegit(numbers, f),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
        );

  static List<Widget> getWegit(List<String> numbers, Function f) {
    List<Widget> childWegits = new List<Widget>();
    for (var item in numbers) {
      childWegits.add(NumberText(item, f));
    }
    return childWegits;
  }
}
