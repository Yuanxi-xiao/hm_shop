import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Morelist extends StatefulWidget {
  Morelist({Key? key}) : super(key: key);

  @override
  _MoreListState createState() => _MoreListState();
}

class _MoreListState extends State<Morelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10
        ), 
      itemBuilder: (BuildContext context,int index){
        return Container(
          child: Text("商品", style: TextStyle(color: Colors.white),),
          color: Colors.blue,
          alignment: Alignment.center,
        );
      });
  }
}