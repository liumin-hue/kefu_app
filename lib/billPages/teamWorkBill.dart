import 'package:flutter/material.dart';

class TeamWorkBillPage extends StatefulWidget {
  @override
  _TeamWorkBillPageState createState() => _TeamWorkBillPageState();
}

class _TeamWorkBillPageState extends State<TeamWorkBillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "维修队工单",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
