import 'package:flutter/material.dart';
//import 'package:appkefudemo/billPages/poolWorkBill.dart';
//import 'package:kefuapp/bill/myWorkBill.dart';
import 'package:kefuapp/billPages/workOrderDeal/workOrderReply.dart';

class WorkBillCard extends StatefulWidget {
  @override
  _WorkBillCardState createState() => _WorkBillCardState();
}

class _WorkBillCardState extends State<WorkBillCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("换热站：密探换热站"),
                  Text("小区：密探楼 2单元 2室 01号"),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text("2020/04/01 04:01:00'"),
                  ),
                  Expanded(flex:3,child: Text("漏水")),
//                  Expanded(flex:1,child: Text("一般")),

//                  Text("2020/04/01 04:01:00"),
//                  Text("漏水"),
                  Text("一般"),
                  SizedBox(width: 10.0,),
//                  Expanded(
//                    flex: 4,
//                    child: Text("2020/04/01 04:01:00'"),
//                  ),
//                  Expanded(flex:4,child: Text("漏水")),
//                  Expanded(flex:2,child: Text("一般")),
                ],
              ),
            ],
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkOrderReplyPage()));
          },
        ),
      ),
    );
  }
}
