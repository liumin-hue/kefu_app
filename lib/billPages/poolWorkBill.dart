import 'package:flutter/material.dart';

class PoolWorkBillPage extends StatefulWidget {
  @override
  _PoolWorkBillPageState createState() => _PoolWorkBillPageState();
}

class _PoolWorkBillPageState extends State<PoolWorkBillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "工单池",
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
