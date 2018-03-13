import 'package:flutter/material.dart';
import 'package:flutter_app/app/item/companylistitem.dart';
import 'package:flutter_app/app/model/company.dart';
import 'package:flutter_app/app/page/companydetail.dart';

class CompanyTab extends StatefulWidget {
  @override
  CompanyList createState() => new CompanyList();
}

class CompanyList extends State<CompanyTab> {

  List<Company> _companties = [];

  @override
  void initState() {
    super.initState();
    getCompanyList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
            '公 司', style: new TextStyle(fontSize: 20.0, color: Colors.white)),
//        actions: <Widget>[
//          new IconButton(
//            icon: new Icon(Icons.find_in_page, color: Colors.white,),
//            onPressed: () {
//              print('onclick');
//            },
//          )
//        ],
      ),
      body: new ListView.builder(
          itemCount: _companties.length, itemBuilder: buildCompanyItem),
    );
  }

  buildCompanyItem(BuildContext context, int index) {
    Company company = _companties[index];

    var companyItem = new GestureDetector(
        onTap: () => navCompanyDetail(company, index),
        child: new CompanyListItem(company)
    );

    return companyItem;
  }

  void getCompanyList() {
    setState(() {
      _companties = Company.fromJson("""
          {
            "list": [
              {
                "logo": "https://img2.bosszhipin.com/mcs/chatphoto/20160220/6042752606dc6957d81c5f08f409db8e5e01c286644ac62b728b8918eb85ca28.jpg",
                "name": "平安银行",
                "location": "上海徐汇区平安大厦凯滨路206号",
                "type": "互联网",
                "size": "已上市",
                "employee": "10000人以上",
                "hot": "前端架构师",
                "count": "400"
              },
              {
                "logo": "https://img.bosszhipin.com/beijin/mcs/chatphoto/20170927/60158fe74a9233b55ee08206ca5df1dccfcd208495d565ef66e7dff9f98764da.jpg",
                "name": "百度",
                "location": "上海市浦东新区",
                "type": "互联网",
                "size": "已上市",
                "employee": "10000人以上",
                "hot": "Android架构师",
                "count": "300"
              },
              {
                "logo": "https://img2.bosszhipin.com/mcs/chatphoto/20160317/5d308646e6e4bc4e68d5f97a74c14dcda2d41b7cc34321f537d83206460d4ca6.jpg",
                "name": "欧那教育",
                "location": "普陀区长寿路137号财富时代大厦6楼",
                "type": "互联网教育",
                "size": "A轮",
                "employee": "100-400人",
                "hot": "app技术经理",
                "count": "50"
              }
            ]
          }
      """);
    });
  }

  navCompanyDetail(Company company, int index) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return new CompanyDetail();
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: new SlideTransition(position: new Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation), child: child),
          );
        }
    ));
  }
}
