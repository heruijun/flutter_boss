import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/company.dart';

class JobsTab extends StatefulWidget {
  @override
  JobList createState() => new JobList();
}

class JobList extends State<JobsTab> {

  List<Company> companties = [];

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
          itemCount: companties.length, itemBuilder: buildCompanyItem),
    );
  }

  buildCompanyItem(BuildContext context, int index) {
    Company company = companties[index];

    var companyItem = new GestureDetector(

      // onTap: () => navigateToMovieDetailPage(movie, index),

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
                      new Container(
                        child: new Text(
                          company.name,
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0
                          ),
                        ),
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 10.0, bottom: 5.0),
                      ),

                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 10.0,
                          right: 5.0,
                          bottom: 5.0,
                        ),
                        child: new Text(company.location),
                      ),

                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 10.0,
                          right: 5.0,
                          bottom: 5.0,
                        ),
                        child: new Text(
                            company.type + " | " + company.size + " | " +
                                company.employee),
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
                            child: new Text(
                                "热招：" + company.hot + " 等" + company.count +
                                    "个职位"),
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

    return companyItem;
  }

  void getCompanyList() {
    setState(() {
      companties = Company.fromJson();
    });
  }

}