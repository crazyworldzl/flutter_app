import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Home home = Home();

class Home extends StatelessWidget {
  HomeStatefulWidget homeStatefulWidget;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: homeStatefulWidget = HomeStatefulWidget(),
      title: 'home',
    );
  }
}

class HomeStatefulWidget extends StatefulWidget {
  HomeState homeState;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeState = HomeState();
  }
}

class HomeState extends State<HomeStatefulWidget>
    with SingleTickerProviderStateMixin {
  TabController mController;
  List<String> tabs;
  int mIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = ['1111', '22222', '33333'];
    mController = TabController(
      length: tabs.length,
      vsync: this,
    );
    mController.addListener(() {
      print('zlmsg changed');
      if (mController.index.toDouble() == mController.animation.value) {
        //赋值 并更新数据
        setState(() {
          mIndex = mController.index;
        });
      }
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Scaffold(
        appBar: TabBar(
          isScrollable: true,
          controller: mController,
          labelStyle: TextStyle(),
          labelColor: Color(0xff89381f),
          unselectedLabelColor: Color(0xff00f00f),
          tabs: tabs.map((t) {
            return Tab(text: t);
          }).toList(),
        ),
        body: TabBarView(
          children: tabs.map((t) {
            return Text(t);
          }).toList(),
          controller: mController,
        ),
        bottomNavigationBar: BottomView(tabs, mIndex, (i) {
          setState(() {
            mIndex = i;
            mController.index=i;
          });
        }),
      ),
    );
  }
}

class BottomView extends BottomNavigationBar {
  BottomView(List<String> tabs, int index, ValueChanged<int> state)
      : super(
          items: tabs.map((f) {
            return BottomNavigationBarItem(
                title: Text(f),
                icon: Image(
                  image: AssetImage('../image/ic_launcher.png'),
                ));
          }).toList(),
          selectedItemColor: Color(0xff000000),
          unselectedItemColor: Color(0xff555555),
          currentIndex: index,
          onTap: state,

        ) ;

  @override
  createState() {
    // TODO: implement createState
    return super.createState();
  }
}
