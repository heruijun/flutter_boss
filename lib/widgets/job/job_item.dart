import 'package:flutter/material.dart';
import 'package:flutter_boss/model/job.dart';

class JobItem extends StatelessWidget {
  final Job job;

  JobItem({Key key, this.job, this.onPressed}) : super(key: key);
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
                new Expanded(
                    child: Text(
                  job.title,
                  style: new TextStyle(color: Colors.black, fontSize: 16),
                )),
                Text(
                  job.salary,
                  style:
                      new TextStyle(color: new Color(0xFF54cbc4), fontSize: 18),
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(job.company),
            ),
            new Container(
              decoration: new BoxDecoration(
                  color: new Color(0xFFF6F6F8),
                  borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
              padding: const EdgeInsets.only(
                  top: 3.0, bottom: 3.0, left: 8.0, right: 8.0),
              margin: const EdgeInsets.only(top: 12.0, bottom: 8.0),
              child: Text(
                job.info,
                style: new TextStyle(color: new Color(0xFF9fa3b0)),
              ),
            ),
            new Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(job.head),
                  radius: 15,
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(job.publish),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
