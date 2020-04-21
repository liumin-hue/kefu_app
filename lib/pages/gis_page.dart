import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:number_display/number_display.dart';
import 'liquid_script.dart' show liquidScript;

class GISPage extends StatefulWidget {
  @override
  _GISPageState createState() => _GISPageState();
}

class _GISPageState extends State<GISPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "GIS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: Text('Using extension', style: TextStyle(fontSize: 20)),
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              ),

              Container(
                child: Echarts(
                  extensions: [liquidScript],
                  option: '''
                      {
                        grid: {
                          left: '0%',
                          right: '0%',
                          bottom: '0%',
                          top: '0%',
                        },
                        series: [{
                          type: 'liquidFill',
                          data: [0.6]
                        }] 
                      }
                    ''',
                ),
                width: 300,
                height: 250,
              ),
            ],
          ),
        )
    );
  }
}

