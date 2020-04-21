import 'package:flutter/material.dart';
import 'package:kefuapp/pages/home_page.dart';
import 'package:kefuapp/pages/static_page.dart';
import 'package:kefuapp/pages/gis_page.dart';
import 'package:kefuapp/pages/setting_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  //当前选中得索引
  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState() {
    // TODO: implement initState
    list
      ..add(HomePage())
      ..add(StaticPage())
      ..add(GISPage())
      ..add(SettingPage());

    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: ,
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //底部按钮类型
        type: BottomNavigationBarType.fixed,
        //底部按钮大小
        iconSize: 24.0,
//        fixedColor: Colors.red,
        //点击按钮回调得函数
        onTap: _onItemTapped,
        //当前得索引
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('统计'), icon: Icon(Icons.table_chart)),
          BottomNavigationBarItem(
              title: Text('GIS'), icon: Icon(Icons.edit_location)),
          BottomNavigationBarItem(
              title: Text('设置'), icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}

