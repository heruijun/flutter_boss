import 'dart:convert';

import 'package:meta/meta.dart';

class Company {
  final String logo; // logo
  final String name; // 公司名称
  final String location; // 公司位置
  final String type; // 公司性质
  final String size; // 公司规模
  final String employee; // 公司人数
  final String hot; // 热招职位
  final String count; // 职位总数

  //构造函数
  Company({
    @required this.logo,
    @required this.name,
    @required this.location,
    @required this.type,
    @required this.size,
    @required this.employee,
    @required this.hot,
    @required this.count
  });

  static List<Company> fromJson() {
    return JSON
        .decode("""
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
              },
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
              },
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
              },
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
              },
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
              },
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
      """)['list']
        .map((obj) => Company.fromMap(obj))
        .toList();
  }

  static Company fromMap(Map map) {
    return new Company(
        logo: map['logo'],
        name: map['name'],
        location: map['location'],
        type: map['type'],
        size: map['size'],
        employee: map['employee'],
        hot: map['hot'],
        count: map['count']
    );
  }
}