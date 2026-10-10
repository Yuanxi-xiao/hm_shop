import 'package:flutter/cupertino.dart';
import 'package:hm_shop/components/Home/Category.dart';
import 'package:hm_shop/components/Home/Hot.dart';
import 'package:hm_shop/components/Home/MoreList.dart';
import 'package:hm_shop/components/Home/Slider.dart';
import 'package:hm_shop/components/Home/Suggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<BannerItem> _bannerlist = [
    BannerItem(
      id: '1', 
      imgful: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg"),
      BannerItem(
      id: '2', 
      imgful: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png"),
      BannerItem(
      id: '2', 
      imgful: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg")
  ];

  //获取滚动容器的内容
  List<Widget> _getScrollChilden(){
    return [
      //包裹普通widget的sliver家族的组件
      SliverToBoxAdapter(child: Slider(bannerlist: _bannerlist,)), //轮播图插件
      //放置分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),//间隙

      SliverToBoxAdapter(child: Category(),),//分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: Suggestion(),),//推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hot()),
              SizedBox(width: 10),
              Expanded(child: Hot(),)
            ],
          )
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      Morelist(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChilden());
  }
}