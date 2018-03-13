import 'dart:convert';

import 'package:meta/meta.dart';

class Job {
  final String name;
  final String cname;
  final String size;
  final String salary;
  final String username;
  final String title;

  Job({
    @required this.name,
    @required this.cname,
    @required this.size,
    @required this.salary,
    @required this.username,
    @required this.title
  });

  static List<Job> fromJson() {
    return JSON
        .decode("""
          {
            "list": [
              {
                "name": "架构师（Android）",
                "cname": "平安银行",
                "size": "已上市",
                "salary": "25k-35k",
                "username": "Claire",
                "title": "HR"
              },
              {
                "name": "架构师（Android）",
                "cname": "平安银行",
                "size": "已上市",
                "salary": "25k-35k",
                "username": "Claire",
                "title": "HR"
              }
            ]
          }
      """)['list']
        .map((obj) => Job.fromMap(obj))
        .toList();
  }

  static Job fromMap(Map map) {
    return new Job(
        name: map['name'],
        cname: map['cname'],
        size: map['size'],
        salary: map['salary'],
        username: map['username'],
        title: map['title']
    );
  }
}