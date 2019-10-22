import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomeStatefulWidget(),
      title: 'home',
    );
  }
}

class HomeStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<HomeStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),

        ),
        body: PageView(
          children: <Widget>[
            Text('11111111111'),
            Text('222222222222'),
            Text('333333333333333'),
          ],
          onPageChanged: (t) => {},
          scrollDirection: Axis.horizontal,
        ));
  }
}
