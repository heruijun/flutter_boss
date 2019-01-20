import 'package:flutter/material.dart';
import 'package:flutter_boss/model/company.dart';

class CompanyItem extends StatelessWidget {
  final Company company;
  final String heroLogo;

  CompanyItem({Key key, this.company, this.onPressed, @required this.heroLogo})
      : super(key: key);
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.only(
            left: 18.0, top: 10.0, right: 18.0, bottom: 10.0),
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Hero(
                    tag: heroLogo,
                    child: Image.network(
                      company.logo,
                      width: 40,
                    ),
                  ),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        company.company,
                        style: new TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Text(
                      company.info,
                      style: new TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            new Container(
              decoration: new BoxDecoration(
                  color: new Color(0xFFF6F6F8),
                  borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
              padding: const EdgeInsets.only(
                  top: 3.0, bottom: 3.0, left: 8.0, right: 8.0),
              margin: const EdgeInsets.only(top: 12.0),
              child: Text(
                company.hot,
                style: new TextStyle(color: new Color(0xFF9fa3b0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
