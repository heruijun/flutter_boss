import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_boss/common/config/config.dart';
import 'package:flutter_boss/model/company.dart';
import 'package:flutter_boss/widgets/company/company_detail_page.dart';
import 'package:flutter_boss/widgets/company/company_item.dart';
import 'package:http/http.dart' as http;

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage>
    with AutomaticKeepAliveClientMixin {
  List<Company> companyList = List<Company>();

  Future<List<Company>> _fetchCompanyList() async {
    final response = await http.get('${Config.BASE_URL}/company/list/1');

    List<Company> companyList = List<Company>();

    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      for (dynamic data in result['data']['companies']) {
        Company companyData = Company.fromJson(data);
        companyList.add(companyData);
      }
    }
    return companyList;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('公 司',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: new Center(
        child: FutureBuilder(
          future: _fetchCompanyList(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new CircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return _createListView(context, snapshot);
            }
          },
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Company> companyList = snapshot.data;
    return ListView.builder(
      key: new PageStorageKey('company-list'),
      itemCount: companyList.length,
      itemBuilder: (BuildContext context, int index) {
        return CompanyItem(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // fullscreenDialog: true,
                builder: (context) => CompanyDetailPage(
                    company: companyList[index], heroLogo: "heroLogo${index}"),
              ),
            );
          },
          company: companyList[index],
          heroLogo: "heroLogo${index}",
        );
      },
    );
  }
}
