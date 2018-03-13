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

  static List<Company> fromJson(String json) {
    return JSON
        .decode(json)['list']
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