import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/company.dart';
import 'package:flutter_app/app/view/company/company_hot_job.dart';
import 'package:flutter_app/app/view/company/company_inc.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class CompanyDetail extends StatefulWidget {

  final Company _company;

  CompanyDetail(this._company);

  @override
  CompanyDetailState createState() => new CompanyDetailState();
}

class CompanyDetailState extends State<CompanyDetail>
    with TickerProviderStateMixin {

  final double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(text: '公司概况'),
      new Tab(text: '热招职位'),
    ];
    _pages = [
      new CompanyInc(widget._company.inc),
      new CompanyHotJob(),
    ];
    _controller = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating ||
                  _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              flexibleSpace: new FlexibleSpaceBar(
                title: new Text(widget._company.name,
                    style: new TextStyle(color: Colors.white)),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Image.network(
                      'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
                      fit: BoxFit.cover,
                      height: _appBarHeight,
                    ),

                    const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: const LinearGradient(
                          begin: const Alignment(0.0, -1.0),
                          end: const Alignment(0.0, -0.4),
                          colors: const <Color>[
                            const Color(0x60000000), const Color(0x00000000)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: new Column(
                      children: [
                        new TabBar(
                          labelColor: Colors.black,
                          controller: _controller,
                          tabs: _tabs,
                          indicatorColor: Theme
                              .of(context)
                              .primaryColor,
                        ),

                        new SizedBox.fromSize(
                          size: const Size.fromHeight(600.0),
                          child: new TabBarView(
                              controller: _controller,
                              children: _pages
                          ),
                        )
                      ],
                    ),
                  ),
                ])
            )
          ],
        ),
      );
  }
}