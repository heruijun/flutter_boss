import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  MenuItem({Key key, this.icon, this.title, this.onPressed}) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 12.0,
              right: 20.0,
              bottom: 10.0,
            ),
            child: new Row(
              children: [
                new Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: new Icon(
                    icon,
                    color: Colors.black54,
                  ),
                ),
                new Expanded(
                  child: new Text(
                    title,
                    style: new TextStyle(color: Colors.black54, fontSize: 16.0),
                  ),
                ),
                new Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: new Divider(),
          )
        ],
      ),
    );
  }
}
