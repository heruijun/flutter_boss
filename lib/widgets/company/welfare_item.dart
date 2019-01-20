import 'package:flutter/material.dart';

class WelfareItem extends StatelessWidget {
  WelfareItem({Key key, this.iconData, this.title}) : super(key: key);

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 120.0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        border: Border.all(
          color: Colors.white,
          width: 0.25,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
            size: 32.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Text(
            title,
            style: new TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
