import 'package:flutter/material.dart';
import 'package:flutter_app/app/item/messagelistitem.dart';
import 'package:flutter_app/app/model/company.dart';
import 'package:flutter_app/app/model/message.dart';
import 'package:flutter_app/app/page/companydetail.dart';

class MessageTab extends StatefulWidget {
  @override
  MessageList createState() => new MessageList();
}

class MessageList extends State<MessageTab> {

  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    getMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
            '消 息', style: new TextStyle(fontSize: 20.0, color: Colors.white)),
//        actions: <Widget>[
//          new IconButton(
//            icon: new Icon(Icons.find_in_page, color: Colors.white,),
//            onPressed: () {
//              print('onclick');
//            },
//          )
//        ],
      ),
      body: new ListView.builder(
          itemCount: _messages.length, itemBuilder: buildCompanyItem),
    );
  }

  buildCompanyItem(BuildContext context, int index) {
    Message message = _messages[index];

    var messageItem = new GestureDetector(
        onTap: () {
          showDialog(context: context, child: new AlertDialog(
              content: new Text(
                "尽情期待!",
                style: new TextStyle(fontSize: 20.0),
              )));
        },
        child: new MessageListItem(message)
    );

    return messageItem;
  }

  void getMessageList() {
    setState(() {
      _messages = Message.fromJson("""
          {
            "list": [
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              }
            ]
          }
      """);
    });
  }
}
