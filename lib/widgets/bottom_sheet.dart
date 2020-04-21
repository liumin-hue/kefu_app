import 'package:flutter/material.dart';

class IBottomSheet extends StatelessWidget {
  final list;
  final Function listener; 
  IBottomSheet({
    Key key,
    @required this.list,
    this.listener
  }): super(key: key);

  Widget cancelContain(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Text('取消', style: TextStyle(
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
            color: Color(0xFF333333),
            fontSize: 18),
          ),
        )
      ),
    );
  }

  Widget listContain(BuildContext context, int index) {
    if(list.length == 0) return Container();
    return Container(
      height: 40.0,
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Text(list[index], style: TextStyle(
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
            color: Color(0xFF333333),
            fontSize: 18)
          ),
        ),
        onTap: (){
          Navigator.pop(context);
          listener(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: Container(
            height: 160.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              // itemExtent: 40.0,
              itemCount: list.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == list.length) {
                  return cancelContain(context);
                }
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey[300],width: 0.33))
                  ),
                  child: listContain(context, index),
                );
              },
            ),
          )
        )
      ],
    );
  }
}
