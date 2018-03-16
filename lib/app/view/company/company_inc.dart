import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyInc extends StatelessWidget {

  final String _companyInc;

  CompanyInc(this._companyInc);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: new Container(
          color: Colors.white,
          child: new Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: new Text(
                            '公司介绍', style: new TextStyle(fontSize: 15.0)),
                      )
                    ],
                  ),

                  new RichText(
                    text: new TextSpan(
                      text: _companyInc,
                      style: new TextStyle(
                          fontSize: 13.0,
                          color: Colors.black
                      ),
                    ),
                  )
                ],
              )
          )
      ),
    );
  }
}