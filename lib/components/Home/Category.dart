import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Category extends StatefulWidget {
  final List<CategoryItem> categorylist;
  Category({Key? key,required this.categorylist}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          //从widget中获取分类列表
          final category = widget.categorylist[index];

          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 251, 232, 234),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 50, height: 40,),
                Text(category.name, style: TextStyle(color: Colors.black),),
              ],
            ),
          );
        },
      ),
    );
  }
}