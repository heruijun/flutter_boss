import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/company.dart';
import 'package:flutter_app/app/view/company/company_inc.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class CompanyDetail extends StatelessWidget {

  final Company _company;
  final double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  CompanyDetail(this._company);

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
                title: new Text(_company.name,
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
                  new Column(
                    children: [
                      new CompanyInc(_company.inc)
                    ],
                  ),
                ])
            )
          ],
        ),
      );
  }
}