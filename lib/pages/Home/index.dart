import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hm_shop/api/home.dart';
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

  List<BannerItem> _bannerlist = [
    // BannerItem(
      // id: '1', 
      // imgful: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg"),
      // BannerItem(
      // id: '2', 
      // imgful: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png"),
      // BannerItem(
      // id: '2', 
      // imgful: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg")
  ];
  //分类列表
  List<CategoryItem> _categorylist = [];
  //获取滚动容器的内容
  List<Widget> _getScrollChilden(){
    return [
      //包裹普通widget的sliver家族的组件
      SliverToBoxAdapter(child: Slider(bannerlist: _bannerlist,)), //轮播图插件
      //放置分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),//间隙

      SliverToBoxAdapter(child: Category(categorylist: _categorylist,)),//分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: Suggestion(recommendItem: recommendItem,)),//推荐组件
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

  //封裝推荐
  RecommendItem recommendItem = RecommendItem(id: "", title: "", subTypes: []);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannderList();
    _getCategoryList();
    _getRecommendList();
  }
  
  //获取轮播图列表
  void _getBannderList() async{
    _bannerlist = await getBannerListAPI();
    setState(() {});
  }

  //获取分类列表
  void _getCategoryList() async{
    _categorylist = await getCategoryListAPI();
    setState(() {});
  }

  //获取特惠推荐（线上明细接口已下线，改用本地JSON）
  void _getRecommendList() async{
    final str = await rootBundle.loadString('lib/viewmodels/特惠推荐.json');
    final data = json.decode(str) as Map<String, dynamic>;
    recommendItem = RecommendItem.formJSON(data["result"] as Map<String, dynamic>);
    if (!mounted) return;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChilden());
  }
}