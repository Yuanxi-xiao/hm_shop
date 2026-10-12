import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Suggestion extends StatefulWidget {
  RecommendItem recommendItem;
  Suggestion({Key? key, required this.recommendItem}) : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  Widget _bulidHeader () {
    return Row(
      children: [
        Text("特惠推荐", style: TextStyle(
          color:Color.fromRGBO(146, 48, 12, 1),
          fontSize: 18,
          fontWeight: FontWeight.w700
          ),),
          SizedBox(width: 10,),
        Text("精选省攻略",style: TextStyle(
          color: Color.fromRGBO(189, 83, 45, 1),
          fontSize: 12,
        ),)
      ],
    );
  }

  //左侧结构
  Widget _bulidLeft () {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        image:DecorationImage(
          image:  AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover
          ) 
      ),
    );
  }

  //右侧结构(只取前3条)
  List<GoodsItem> _getDisplayItem () {
    if(widget.recommendItem.subTypes.isEmpty) return [];
    return widget.recommendItem.subTypes.first.goodsItems.items.take(3).toList();
  }

  List<Widget> _getChilderList () {
    List<GoodsItem> list = _getDisplayItem(); //取到前三条数据
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              errorBuilder:(context, error, stackTrace){
                //返回一个新的部件替换原有图片
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  width: 100, 
                  height: 140,
                  fit: BoxFit.cover,
                );
              },
              list[index].picture, 
              width: 100, 
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding:EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 240, 96, 12)
            ),
              child: Text("¥${list[index].price}" ,style: TextStyle(color: Colors.white),),
          )
        ],
      );
    });
  }

  //完成渲染
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover
            ),
          ),
        child: Column(
          children: [
            _bulidHeader(), //
            SizedBox(height: 10,),
            Row(
              children: [_bulidLeft(), Expanded(child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _getChilderList(),
              )
              )],
            )
          ],
        ),
      )
    );
  }
}