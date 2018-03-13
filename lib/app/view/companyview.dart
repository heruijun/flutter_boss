import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/company.dart';

class CompanyTab extends StatefulWidget {
  @override
  CompanyList createState() => new CompanyList();
}

class CompanyList extends State<CompanyTab> {

  List<Company> companties = [];

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
          itemCount: companties.length, itemBuilder: buildCompanyItem),
    );
  }

  buildCompanyItem(BuildContext context, int index) {
    Company company = companties[index];

    var companyItem = new GestureDetector(

      // onTap: () => navigateToMovieDetailPage(movie, index),

      child: new Padding(
        padding: const EdgeInsets.only(
          top: 3.0,
          left: 5.0,
          right: 5.0,
          bottom: 3.0,
        ),

        child: new SizedBox(
          child: new Card(
            elevation: 0.0,
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 15.0,
                    right: 15.0,
                    bottom: 0.0,
                  ),
                  child: new Image.network(
                    company.logo,
                    width: 50.0,
                    height: 50.0,),
                ),

                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          company.name,
                          textAlign: TextAlign.left,
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                      ),

                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 0.0,
                          right: 5.0,
                          bottom: 5.0,
                        ),
                        child: new Text(company.location, style: new TextStyle(
                            fontSize: 13.0, color: Colors.grey)),
                      ),

                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 0.0,
                          right: 5.0,
                          bottom: 5.0,
                        ),
                        child: new Text(
                            company.type + " | " + company.size + " | " +
                                company.employee, style: new TextStyle(
                            fontSize: 13.0, color: Colors.grey)),
                      ),

                      new Divider(),
                      new Row(
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              left: 0.0,
                              right: 5.0,
                              bottom: 15.0,
                            ),
                            child: new Text(
                                "热招：" + company.hot + " 等" + company.count +
                                    "个职位", style: new TextStyle(
                                fontSize: 13.0, color: Colors.grey)),
                          ),
                          new Expanded(child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8.0,
                                ),
                                child: const Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.grey,),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return companyItem;
  }

  void getCompanyList() {
    setState(() {
      companties = Company.fromJson("""
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
}
