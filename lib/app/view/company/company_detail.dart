import 'package:flutter/material.dart';
import 'package:flutter_app/app/component/indicator_viewpager.dart';
import 'package:flutter_app/app/model/company.dart';
import 'package:flutter_app/app/view/company/company_hot_job.dart';
import 'package:flutter_app/app/view/company/company_inc.dart';
import 'package:flutter_app/app/view/company/company_info.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class CompanyDetail extends StatefulWidget {

  final Company _company;

  CompanyDetail(this._company);

  @override
  CompanyDetailState createState() => new CompanyDetailState();
}

class CompanyDetailState extends State<CompanyDetail>
    with TickerProviderStateMixin {

  final double _appBarHeight = 200.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  List<Tab> _tabs;
  List<Widget> _pages;
  List<Widget> _imagePages;
  TabController _controller;
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];

  @override
  void initState() {
    super.initState();
    if (!_urls.isEmpty) {
      _imagePages = <Widget>[];
      _urls.forEach((String url) {
        _imagePages.add(
            new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: new Image.network(
                url,
                fit: BoxFit.cover,
                height: _appBarHeight,
              ),
            ));
      });
    }
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
//                title: new Text(widget._company.name,
//                    style: new TextStyle(color: Colors.white)),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
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

                    new IndicatorViewPager(_imagePages),
                  ],
                ),
              ),
            ),

            new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
                  new Column(
                    children: [
                      new Container(
                        color: Colors.white,
                        child: new Column(
                          children: <Widget>[
                            new CompanyInfo(widget._company),
                            new Divider(),
                            new TabBar(
                              labelColor: Colors.black,
                              controller: _controller,
                              tabs: _tabs,
                              indicatorColor: Theme
                                  .of(context)
                                  .primaryColor,
                            ),
                          ],
                        ),
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
                ])
            )
          ],
        ),
      );
  }
}