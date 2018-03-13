import 'package:flutter/material.dart';
import 'package:flutter_app/app/component/mytab.dart';
import 'package:flutter_app/app/tabs/jobs.dart';
import 'package:flutter_app/app/tabs/companyview.dart';
import 'package:flutter_app/app/tabs/message.dart';
import 'package:flutter_app/app/tabs/mine.dart';

const double _kTabTextSize = 11.0;
const double _kTabIconSize = 30.0;

class BossApp extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<BossApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new JobsTab(), new CompanyTab(), new MessageTab(), new MineTab()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: new TextStyle(fontSize: _kTabTextSize),
          tabs: <MyTab>[
            new MyTab(
              icon: new Icon(Icons.favorite, size: _kTabIconSize),
              text: "职位",
            ),
            new MyTab(
              icon: new Icon(Icons.favorite, size: _kTabIconSize),
              text: "公司",
            ),
            new MyTab(
              icon: new Icon(Icons.adb, size: _kTabIconSize),
              text: "消息",
            ),
            new MyTab(
              icon: new Icon(Icons.airport_shuttle, size: _kTabIconSize),
              text: "我的",
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
      title: "Boss直聘",
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: new Color.fromARGB(255, 0, 215, 198),
        accentColor: Colors.cyan[300],
      ),
      home: new BossApp()));
}