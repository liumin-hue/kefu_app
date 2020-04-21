import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kefuapp/widgets/bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:kefuapp/billPages/myWorkBill.dart';

class WorkOrderReplyPage extends StatefulWidget {
  @override
  _WorkOrderReplyPageState createState() => _WorkOrderReplyPageState();
}

class _WorkOrderReplyPageState extends State<WorkOrderReplyPage>{
  List<File> _imgList = [];
  List<String> _netImgList = [];
  dynamic _pickImageError = "error";

  get duration => null;

  chooseImg(context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          List list = new List();
          list.add('拍照');
          list.add('从相册中选择');
          return IBottomSheet(
            list: list,
            listener: chooseItem,
          );
        }
    );
  }

  showBigImage(Image img) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: img,
          );
        }
    );
  }
//      img1.length().then((len) {
//        print(len);
//      });
//      print(img1.lengthSync());
  chooseItem(int index) async{
    if(index == 0) {
      print('拍照');
      var img = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality:50);
      if(img != null){
        setState(() {
          _imgList.add(img);
        });
      }
    } else {
      var img = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality:50);
      if(img != null){
        setState(() {
          _imgList.add(img);
        });
      }
    }
  }

  getImageList() {
    List<Widget> list = new List<Widget>();
    for(var i=0; i<_netImgList.length; i++) {
      list.add(
          Container(
              margin: const EdgeInsets.only(left: 10.0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    child: Image.network(_netImgList[i], height: 50.0, width: 50.0,),
                    onTap: () {
                      showBigImage(Image.network(_netImgList[i]));
                    },
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    child: Align(
                        widthFactor: 2,
                        heightFactor: 2,
                        alignment: Alignment(1.5, -1.5),
                        child: GestureDetector(
                          child: Image.asset('images/close.png', width: 18.0,height: 18.0,),
                          onTap: (){
//                            DataUtils.deleteImage({
//                              'fileName': _netImgList[i].split('Image/')[1],
//                              'cusID': widget.pageData.cusID,
//                              'cusName': widget.pageData.cusName,
//                            }).then((res) {
//                              if(res['IsSuccess']) {
//                                setState(() {
//                                  _netImgList.removeAt(i);
//                                });
//                              }else{
//                                Toast.show(res['Message'], context, duration: 2, gravity: 0);
//                              }
//                            });
                          },
                        )
                    ),
                  )
                ],
              )
          )
      );
    }
    for(var i=0; i<_imgList.length; i++) {
      int imgLength = (_imgList[i].lengthSync()~/1024);
      list.add(
          Container(
              margin: const EdgeInsets.only(left: 10.0),
//              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    child: Image.file(_imgList[i], height: 50.0, width: 50.0,),
                    onTap: () {
                      showBigImage(Image.file(_imgList[i]));
                    },
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    child: Align(
                        widthFactor: 20.0,
                        heightFactor: 20.0,
                        alignment: Alignment(1.0, -1.5),
                        child: GestureDetector(
                          child: Image.asset('images/close.png', width: 18.0,height: 18.0,),
                          onTap: (){
                            setState(() {
                              _imgList.removeAt(i);
                            });
                          },
                        )
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    child:  Align(
                        widthFactor: 2,
                        heightFactor: 2,
                        alignment: Alignment(0.5, 2.0),
                        child: GestureDetector(
                          child: Text(
                            '$imgLength KB',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0
                            ),
                          ),
                        )
                    ),
                  )
                ],
              )
          )
      );
    }
    return list;
  }

  final eidtController = TextEditingController();
  showToast() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("标题"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text('信息一'), Text('信息二')],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  errorToast() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("提示"),
            content: SingleChildScrollView(
              child: Center(
                child: Text(_pickImageError),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "工单回复",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
//        padding: EdgeInsets.only(top: 5.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 6.0, left: 12.0, right: 12.0),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('客户地址'), Text('测试小区1号楼1单元001室')],
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 6.0, left: 12.0, right: 12.0),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('客服姓名'), Text('测试客户')],
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 6.0, left: 12.0, right: 12.0),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('受理时间'), Text('2020-02-02 02:02')],
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 6.0, left: 12.0, right: 12.0),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('完成情况'),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text('同意'),
                          value: '同意',
                        ),
                        DropdownMenuItem(
                          child: Text('拒绝'),
                          value: '拒绝',
                        ),
                      ],
                      hint: Text(
                        '请选择',
                        style: TextStyle(),
                      ),
                      onChanged: (value) {
                        print(value);
                      },
                      isDense: true,
//                      elevation: 24,//设置阴影的高度
//                      style: TextStyle(//设置文本框里面文字的样式
//                        color: Color(0xff4a4a4a),
//                        fontSize: 12,
//                      ),
//                      iconSize: 40.0,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 6.0, left: 12.0, right: 12.0),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('具体情况'),
                    Container(
                      child: InkWell(
                        child: Text('请选择'),
                        onTap: () {
                          showToast();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 6.0, left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex:1,
                        child: Text(
                          '图片：',
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
    //                      children: _imgList.map((item){
    //                        return GestureDetector(
    //                          child: Container(
    //                            margin: const EdgeInsets.only(right: 4.0),
    //                            color: Colors.grey[300],
    //                            child: Image(
    //                              image: NetworkImage(item),
    //                              width: 50,
    //                              height: 50,
    //                              fit: BoxFit.contain,
    //                            ),
    //                          ),
    //                          onTap: (){
    //                            showBigImage(item);
    //                          },
    //                        );
    //                      }).toList(),
                            children: getImageList()
                        ),
                      ),
                      _imgList.length + _netImgList.length < 5 ?
//                      IconButton(
//                          icon:Icon(Icons.camera_alt,color: Colors.blue, size: 35.0,),
//                          onPressed: (){
//                            chooseImg(context);
//                          },
//                      ): Container(),
                      InkWell(
                        child: Container(
                            width: 50.0,
                            height: 50.0,
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Image.asset('images/camera.png')
                        ),
                        onTap: () {
                          chooseImg(context);
                        },
                      ): Container()
                ],
              ),
            ),
            Divider(),
//            Container(
//              height: 60.0,
//              child: Row(
//                children: <Widget>[
//                  Text('图片', style: TextStyle(fontSize: 14.0, color:Color(0xff333333))),
//                  Row(
//                      children: getImageList()
//                  ),
//                  _imgList.length + _netImgList.length < 5 ?
//                  InkWell(
//                    child: Container(
//                        width: 50.0,
//                        height: 50.0,
//                        margin: const EdgeInsets.only(left: 10.0),
//                        child: Image.asset('assets/image/camera.png')
//                    ),
//                    onTap: () {
//                      chooseImg(context);
//                    },
//                  ): Container()
//                ],
//              ),
//            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
//      floatingActionButton: RaisedButton.icon(
//        label: Text('回复'),
//        onPressed: () {
//          print('${eidtController.text}');
//        },
//        icon: Icon(Icons.edit)
//      ),
    );
  }


}
