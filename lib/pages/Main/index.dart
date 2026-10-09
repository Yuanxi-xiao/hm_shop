import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 底部tab列表
  final List<Map<String,String>> _tabList = [
    {
    "icon":"lib/assets/ic_public_home_normal.png", //首页图标
    "active_icon":"lib/assets/ic_public_home_active.png", //首页选中图标
    "text":"首页"
    },
    {
    "icon":"lib/assets/ic_public_pro_normal.png", //分类图标
    "active_icon":"lib/assets/ic_public_pro_active.png", //分类选中图标
    "text":"分类"
    },
    {
    "icon":"lib/assets/ic_public_cart_normal.png", //购物车图标
    "active_icon":"lib/assets/ic_public_cart_active.png", //购物车选中图标
    "text":"购物车"
    },
    {
    "icon":"lib/assets/ic_public_my_normal.png", //我的图标
    "active_icon":"lib/assets/ic_public_my_active.png", //我的选中图标
    "text":"我的"
    }
  ];

// 当前选中的tab
int _currentIndex = 0;


//返回底部渲染的四个tab
  List<BottomNavigationBarItem> _getTabBarWeiget(){
    return List.generate(_tabList.length, (int index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!,width: 24,height: 24,),// 显示普通图标
        activeIcon: Image.asset(_tabList[index]["active_icon"]!,width: 24,height: 24,),//显示选中图标
        label: _tabList[index]["text"]);
    });
  }

  //四个页面展示
  List<Widget> _getChildren(){
    return [HomeView(),CategoryView(),CartView(),MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //safeArea避开安全区组件
      body: SafeArea(child: IndexedStack(
        index: _currentIndex,
        children: _getChildren(), //放置几个组件
      )), 
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (int index){
          // 点击tab时，更新当前选中的tab
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items: _getTabBarWeiget()),
    );
  }
}