import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Hot extends StatefulWidget {
  Hot({Key? key}) : super(key: key);

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
       child: Text("爆款推荐", style: TextStyle(color: Colors.white),),
    );
  }
}