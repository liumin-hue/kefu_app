import 'package:flutter/material.dart';
import 'package:kefuapp/billPages/myWorkBill.dart';
import 'package:kefuapp/billPages/poolWorkBill.dart';
import 'package:kefuapp/billPages/ReceiveWorkBill.dart';
import 'package:kefuapp/billPages/teamWorkBill.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column buildButtonColumn(String imgSrc, String label, String routerName, page){
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //手势监听
          GestureDetector(
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(imgSrc, width: 45, height: 45,),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      label,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
            },
          ),
        ],
      );
    }
    Widget buttonSection = new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildButtonColumn('images/my_bill.png', "我的工单",'my_bill',MyWorkBillPage()),
          buildButtonColumn('images/team_bill.png', "维修队工单",'team_bill',TeamWorkBillPage()),
          buildButtonColumn('images/receive_bill.png', "待接收",'receive_bill',ReceiveWorkBillPage()),
          buildButtonColumn('images/my_bill.png', "工单池",'pool_bill',PoolWorkBillPage()),
//        buildButtonColumn('images/team_bill.png', "维修队工单",'my_bill',TeamWorkBillPage()),
        ],
      ),
    );
    return MaterialApp(
        home:new Scaffold(
          appBar: AppBar(
            title: Text(
              "首页",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Image.asset('images/banner.jpg'),
            ),
            buttonSection,
          ],
        ),
        ),
    );
  }
}
