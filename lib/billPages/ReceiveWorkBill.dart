import 'package:flutter/material.dart';

class ReceiveWorkBillPage extends StatefulWidget {
  @override
  _ReceiveWorkBillPageState createState() => _ReceiveWorkBillPageState();
}

class _ReceiveWorkBillPageState extends State<ReceiveWorkBillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "待接收",
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