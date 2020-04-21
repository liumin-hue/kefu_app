//import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kefuapp/widgets/myWorkBillCard.dart';

class MyWorkBillPage extends StatefulWidget {
  @override
  _MyWorkBillPageState createState() => _MyWorkBillPageState();
}

class _MyWorkBillPageState extends State<MyWorkBillPage>
    with SingleTickerProviderStateMixin {
//  TabController _tabController;
  bool isSelected = true;
  void onChanged(val){
    setState(() {
      isSelected = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
//    _tabController.dispose();
    super.dispose();
  }

  getCurrentPage(){
    return Container(
      child: ListView.builder(
        itemCount: 10,
          itemBuilder:(BuildContext context, int index){
            return WorkBillCard();
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color reviewColor = isSelected ? Colors.blue : Colors.white; //待回复选中颜色
    Color recordColor = !isSelected ? Colors.blue : Colors.white; //回复记录选择颜色
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "我的工单",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              new PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                        value: "one", child: new Text('受理时间')),
                    new PopupMenuItem<String>(
                        value: "two", child: new Text('紧急程度')),
                    new PopupMenuItem<String>(
                        value: "three", child: new Text('剩余时间')),
                    new PopupMenuItem<String>(
                        value: "four", child: new Text('催办次数')),
                  ];
                },
                //选择点击事件
                onSelected: (String action) {
                  switch (action) {
                    case "one":
                      print('受理时间');
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      //增加点击逻辑
                      break;
                    case "two":
                      print('紧急程度');
                      //增加点击逻辑
                      break;
                    case "three":
                      print('剩余时间');
                      //增加点击逻辑
                      break;
                    case "four":
                      print('催办次数');
                      //增加点击逻辑
                      break;
                  }
                },
              ),
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      isSelected = true;
                    });
                  },
                  child: Text("待回复"),
                  color: reviewColor,
                  ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      isSelected = false;
                    });
                  },
                  child: Text("回复记录"),
                  color: recordColor,
                ),
              ],
            ),
            Expanded(child: getCurrentPage())
          ],
        )
    );
  }

}
