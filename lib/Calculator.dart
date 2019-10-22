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
      home: MWidget('计算器'),
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
  List<String> dd;
  String lastSymbol = '';
  num lastResult = 0;
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
      margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Color.fromARGB(255, 255, 127, 127),
      child: Text(
        title,
        style: TextStyle(fontSize: 10, decoration: TextDecoration.none),
      ),
    );
  }

  resultMethod(context) {
    return resultWidget = new Container(
      child: Text(
        lastResult.toString(),
        style: TextStyle(decoration: TextDecoration.none, fontSize: 30),
      ),
      color: Color.fromARGB(255, 255, 255, 255),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomRight,
      height: 100,
    );
  }

  calculatorMethod() {
    return new Container(
      child: Text(
        calculatorString,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Color(0xff000000),
            fontSize: 20),
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
      height: MediaQuery.of(context).size.height - 100 - 100 - 23 - 20 - 2,
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
      if (isReset) {
        try {
          num.parse(data);
          calculatorString = data;
          isReset = false;
        } on Exception {
          isReset = true;
        }
        lastSymbol = '';
        lastResult = 0;
      } else if (data == 'CLEAR') {
        calculatorString = '';
        lastSymbol = '';
        lastResult = 0;
        isReset = true;
      } else if (data == 'CE') {
        if(calculatorString.length==1){
          calculatorString='';
          lastSymbol='';
        }else {
          calculatorString =
              calculatorString.substring(0, calculatorString.length - 1);
          lastSymbol = calculatorString.substring(calculatorString.length-1,calculatorString.length);
        }
        print('zlmsg lastSymbol $lastSymbol');
      } else if (data == '=') {
        try {
          num.parse(lastSymbol);
        } on Exception {
          calculatorString =
              calculatorString.substring(0, calculatorString.length - 1);
          lastSymbol = calculatorString.substring(calculatorString.length - 1);
        }

        List<String> numbers = List();
        List<String> symbols = List();
        int numberCount = 0;
        for (int i = 0; i < calculatorString.length; i++) {
          String s = calculatorString.substring(i, i + 1);
          if (s == '+' || s == '-' || s == '*' || s == '/') {
            symbols.add(s);
            ++numberCount;
          } else {
            if (numbers.length - 1 < numberCount) {
              numbers.add(s);
            } else {
              numbers[numberCount] = numbers[numberCount] + s;
            }
          }
        }
        print('zlmsg numbers=$numbers');

        for (int i = 0; i < symbols.length; i++) {
          if (symbols[i] == '*') {
            numbers[i] =
                (num.parse(numbers[i]) * num.parse(numbers[i + 1])).toString();
            numbers.removeAt(i + 1);
            symbols.removeAt(i);
            --i;
          } else if (symbols[i] == '/') {
            numbers[i] =
                (num.parse(numbers[i]) / num.parse(numbers[i + 1])).toString();
            numbers.removeAt(i + 1);
            symbols.removeAt(i);
            --i;
          }
        }

        lastResult = num.parse(numbers[0]);
        for (int i = 0; i < symbols.length; i++) {
          if (symbols[i] == '+') {
            lastResult += num.parse(numbers[i + 1]);
          } else {
            lastResult -= num.parse(numbers[i + 1]);
          }
        }
      } else if (data == '+' || data == '-' || data == '*' || data == '/') {
        if (lastSymbol != data) {
          if (lastSymbol == ".") return;
          try {
            num.parse(lastSymbol);
            calculatorString = calculatorString + data;
          } on Exception {
            calculatorString = calculatorString.replaceRange(
                calculatorString.length - 1, calculatorString.length, data);
          }
          lastSymbol = data;
        }
      } else if (data == '.') {
        if (lastSymbol != '.') {
          lastSymbol = data;
          calculatorString = calculatorString + data;
        }
      } else {
        lastSymbol = data;
        calculatorString = calculatorString + data;
      }
    });
  }
}

class NumberText extends GestureDetector {
  NumberText(String data, Function f)
      : super(
            child: Container(
              child: Text(
                data,
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xff007766),
                  fontStyle: FontStyle.italic,
                ),
              ),
              color: Color(0xff001122),
              width: 100,
            ),
            onTap: () => {f(data)},
            onLongPress: () => {
                  if (data == 'CE') {f('CLEAR')}
                },
  );
}

class RowText extends Row {
  List<Widget> childWegit = new List<Widget>();

  RowText(List<String> numbers, Function f)
      : super(
          children: getWegit(numbers, f),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
