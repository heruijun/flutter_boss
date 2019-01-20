import 'package:flutter/material.dart';
import 'package:flutter_boss/splash.dart';
import 'package:redux/redux.dart';
import 'package:flutter_boss/widgets/chat_page.dart';
import 'package:flutter_boss/widgets/company_page.dart';
import 'package:flutter_boss/widgets/mine_page.dart';
import 'package:flutter_boss/widgets/job_page.dart';
import 'package:flutter_boss/layout_type.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  final Store<int> store;
  final String title;

  App({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: new Color.fromARGB(255, 0, 215, 198),
        accentColor: Colors.cyan[300],
      ),
      home: SplashPage(),
      // home: new MainPage(title: 'Boss直聘'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType _layoutSelection = LayoutType.job;

  Color _colorTabMatching({LayoutType layoutSelection}) {
    return _layoutSelection == layoutSelection ? Colors.cyan[300] : Colors.grey;
  }

  BottomNavigationBarItem _buildItem(
      {String icon, LayoutType layoutSelection}) {
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: new Image.asset(
        icon,
        width: 35.0,
        height: 35.0,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
      ),
    );
  }

  Widget _buildButtonNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
            icon: _layoutSelection == LayoutType.job
                ? "images/ic_main_tab_find_pre.png"
                : "images/ic_main_tab_find_nor.png",
            layoutSelection: LayoutType.job),
        _buildItem(
            icon: _layoutSelection == LayoutType.company
                ? "images/ic_main_tab_company_pre.png"
                : "images/ic_main_tab_company_nor.png",
            layoutSelection: LayoutType.company),
        _buildItem(
            icon: _layoutSelection == LayoutType.chat
                ? "images/ic_main_tab_contacts_pre.png"
                : "images/ic_main_tab_contacts_nor.png",
            layoutSelection: LayoutType.chat),
        _buildItem(
            icon: _layoutSelection == LayoutType.mine
                ? "images/ic_main_tab_my_pre.png"
                : "images/ic_main_tab_my_nor.png",
            layoutSelection: LayoutType.mine),
      ],
      onTap: _onSelectTab,
    );
  }

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }

  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.job);
        break;
      case 1:
        _onLayoutSelected(LayoutType.company);
        break;
      case 2:
        _onLayoutSelected(LayoutType.chat);
        break;
      case 3:
        _onLayoutSelected(LayoutType.mine);
        break;
    }
  }

  Widget _buildBody() {
    LayoutType layoutSelection = _layoutSelection;
    switch (layoutSelection) {
      case LayoutType.job:
        return JobPage();
      case LayoutType.company:
        return CompanyPage();
      case LayoutType.chat:
        return ChatPage();
      case LayoutType.mine:
        return MinePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildButtonNavBar(),
    );
  }
}
