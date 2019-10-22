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

class HomeState extends State<HomeStatefulWidget> with SingleTickerProviderStateMixin {
  TabController mController;
  List<String> tabs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [
      '1111',
      '22222',
      '33333'
    ];
    mController =
        TabController(length: tabs.length,
          vsync: this,
        );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),

        ),
        body:Scaffold(
          appBar: TabBar(
            isScrollable: true,
            controller: mController,
            labelStyle: TextStyle(),
            labelColor: Color(0xff89381f),
            unselectedLabelColor: Color(0xff00f00f),
            tabs: tabs.map((t){return Tab(text: t);}).toList(),
          ),
          body: TabBarView(
            children: tabs.map((t){return Text(t);}).toList(),
            controller: mController,
          ),
        ),);
  }
}
