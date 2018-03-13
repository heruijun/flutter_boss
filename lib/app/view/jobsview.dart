import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/job.dart';

class JobsTab extends StatefulWidget {
  @override
  JobList createState() => new JobList();
}

class JobList extends State<JobsTab> {

  List<Job> _jobs = [];

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
        title: new Text('Android',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: new ListView.builder(
          itemCount: _jobs.length, itemBuilder: buildJobItem),
    );
  }

  buildJobItem(BuildContext context, int index) {
    Job job = _jobs[index];

    var jobItem = new GestureDetector(

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
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 10.0,
                              bottom: 5.0,
                            ),
                            child: new Text(job.name),
                          ),
                          new Expanded(child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                ),
                                child: new Text(
                                    job.salary,
                                    style: new TextStyle(
                                        color: Colors.red)),
                              ),
                            ],
                          ))
                        ],
                      ),

                      new Container(
                        child: new Text(
                          job.cname + ' ' + job.size,
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 15.0, color: Colors.grey),
                        ),
                        margin: const EdgeInsets.only(
                            top: 5.0, left: 10.0, bottom: 5.0),
                      ),

                      new Divider(),
                      new Row(
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              left: 10.0,
                              right: 5.0,
                              bottom: 15.0,
                            ),
                            child: new Text(job.username + " | " + job.title,
                                style: new TextStyle(color: new Color.fromARGB(
                                    255, 0, 215, 198))),
                          ),
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

    return jobItem;
  }

  void getCompanyList() {
    setState(() {
      _jobs = Job.fromJson("""
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
      """);
    });
  }

}