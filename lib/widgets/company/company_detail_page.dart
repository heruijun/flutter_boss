import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_boss/common/config/config.dart';
import 'package:flutter_boss/common/widget/scroll_img_item.dart';
import 'package:flutter_boss/model/company.dart';
import 'package:flutter_boss/model/company_detail.dart';
import 'package:flutter_boss/widgets/company/welfare_item.dart';
import 'package:flutter_boss/widgets/gallery_page.dart';
import 'package:http/http.dart' as http;

class CompanyDetailPage extends StatefulWidget {
  final Company company;
  final String heroLogo;

  CompanyDetailPage({Key key, @required this.company, @required this.heroLogo})
      : super(key: key);

  @override
  _CompanyDetailPageState createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  bool _isShow = false;

//  Animation<double> animation;
//  AnimationController _animationController;
//  bool _isExpanded = false;
//  double _begin = -700.0;
//  double _end = -100.0;

  Future<CompanyDetail> _fetchCompany() async {
    final response = await http
        .get('${Config.BASE_URL}/companyDetail/5c3b757fffd9a60984d706c6');
    if (response.statusCode == 200) {
      CompanyDetail companyDetail = CompanyDetail.fromJson(
          json.decode(response.body)['data']['companyDetail']);
      return companyDetail;
    }
  }

  _scrollListener() {
    setState(() {
      if (_scrollController.offset < 56 && _isShow) {
        _isShow = false;
      } else if (_scrollController.offset >= 56 && _isShow == false) {
        _isShow = true;
      }
    });
  }

//  _onBotttomBarTap() {
//    if (!_isExpanded) {
//      _animationController.forward();
//    } else {
//      _animationController.reverse();
//    }
//  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
//    _animationController = AnimationController(
//        duration: const Duration(milliseconds: 300), vsync: this);
//    animation = Tween(begin: _begin, end: _end).animate(_animationController)
//      ..addListener(() {
//        setState(() {});
//      })
//      ..addStatusListener((status) {
//        if (status == AnimationStatus.completed) {
//          setState(() {
//            _isExpanded = true;
//          });
//        } else if (status == AnimationStatus.dismissed) {
//          setState(() {
//            _isExpanded = false;
//          });
//        }
//      });
  }

  @override
  void dispose() {
//    _animationController.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: Scaffold(
      backgroundColor: new Color.fromARGB(255, 68, 76, 96),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: new NetworkImage(widget.company.logo),
              alignment: Alignment.center),
        ),
        child: _companyDetailView(context),
      ),
    ));
  }

  // 公司详情页面
  Widget _companyDetailView(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            new SliverAppBar(
              elevation: 0.0,
              pinned: true,
              backgroundColor:
                  new Color.fromARGB(_isShow == true ? 255 : 0, 68, 76, 96),
              centerTitle: false,
              title: new Text(
                widget.company.company,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: new Color.fromARGB(
                      _isShow == true ? 255 : 0, 255, 255, 255),
                ),
              ),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              new Row(
                children: [
                  new Expanded(
                    flex: 3,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 25.0,
                            bottom: 10.0,
                          ),
                          child: new Text(
                            '${widget.company.company}',
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0,
                          ),
                          child: new Text(
                            '${widget.company.info}',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                          right: 30.0,
                        ),
                        child: Hero(
                          tag: widget.heroLogo,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.company.logo,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              FutureBuilder<CompanyDetail>(
                future: _fetchCompany(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _companyBody(context, snapshot);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ])),
          ],
        ),
//        Positioned(
//          bottom: animation.value,
//          child: GestureDetector(
//              onTap: _onBotttomBarTap,
//              child: Container(
//                height: MediaQuery.of(context).size.height - 100,
//                width: MediaQuery.of(context).size.width,
//                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.all(12.0),
//                margin: EdgeInsets.symmetric(horizontal: 6.0),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(24.0),
//                      topRight: Radius.circular(24.0)),
//                  color: Colors.white,
//                ),
//                child: Column(
//                  mainAxisSize: MainAxisSize.max,
//                  children: <Widget>[],
//                ),
//              )),
//        ) // new AnimatedContainer(animation: animation)
      ],
    );
  }

  // 主体
  Widget _companyBody(BuildContext context, AsyncSnapshot snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 30.0, left: 25.0, right: 20.0),
            child: _createWorkHours()),
        _createWelfareItem(),
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
          child: Text(
            "公司介绍",
            style: new TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 10.0, right: 25.0),
          child: Text(
            snapshot.data.inc,
            textAlign: TextAlign.justify,
            style: new TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 25.0, bottom: 10.0),
          child: Text(
            "公司照片",
            style: new TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(left: 20.0, top: 20.0, right: 0.0, bottom: 50.0),
          height: 120.0,
          child: _createImgList(context, snapshot),
        )
      ],
    );
  }

  // 上班时间
  Widget _createWorkHours() {
    return Wrap(
      spacing: 40.0,
      runSpacing: 16.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Text(
              '下午1:00-下午10:00',
              style: new TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Text(
              '大小周',
              style: new TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.movie,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Text(
              '偶尔加班',
              style: new TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
      ],
    );
  }

  // 公司福利
  Widget _createWelfareItem() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20.0, top: 0.0, right: 0.0, bottom: 20.0),
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            WelfareItem(iconData: Icons.flip, title: "五险一金"),
            WelfareItem(iconData: Icons.security, title: "补充医疗\n保险"),
            WelfareItem(iconData: Icons.access_alarm, title: "定期体检"),
            WelfareItem(iconData: Icons.face, title: "年终奖"),
            WelfareItem(iconData: Icons.brightness_5, title: "带薪年假"),
          ],
        ),
      ),
    );
  }

  // 公司照片
  Widget _createImgList(BuildContext context, AsyncSnapshot snapshot) {
    List imgList = snapshot.data.companyImgsResult;
    return ListView.builder(
      key: new PageStorageKey('img-list'),
      scrollDirection: Axis.horizontal,
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int index) {
        return ScrollImageItem(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder<Null>(
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: GalleryPage(
                            url: imgList[index], heroTag: 'heroTag${index}'),
                      );
                    },
                  );
                },
                transitionDuration: Duration(milliseconds: 300),
              ),
            );
          },
          url: imgList[index],
          heroTag: 'heroTag${index}',
        );
      },
    );
  }
}
