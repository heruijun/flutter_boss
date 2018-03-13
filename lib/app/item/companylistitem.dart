import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/company.dart';

class CompanyListItem extends StatelessWidget {
  final Company company;

  CompanyListItem(this.company);

  @override
  Widget build(BuildContext context) {
    return new Padding(
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
    );
  }
}