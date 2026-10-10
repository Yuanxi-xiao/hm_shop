import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Slider extends StatefulWidget {
  final List<BannerItem> bannerlist;
  Slider({Key? key, required this.bannerlist}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {

  //控制轮播图跳转的控制器
  CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  Widget _getSlider (){
    //在flutter中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width;//屏幕宽度
    //返回轮播图插件
    //根据数据渲染的不同轮播图的轮播选项
    return CarouselSlider(
      carouselController: _controller, //绑定controller对象
      items: List.generate(
        widget.bannerlist.length, (int index){
          return Image.network(
            widget.bannerlist[index].imgful,
            fit: BoxFit.cover,
            width: screenWidth,
          );
        }), 
      options: CarouselOptions(
        height: 300,
        autoPlayInterval: Duration(seconds: 5),
        onPageChanged:(index, reason) {
          _currentIndex = index;
          setState(() {
            
          });
        },
        viewportFraction: 1,
        autoPlay: true
      ));
  }

  //顶部搜索框
  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding:EdgeInsets.all(10),
        child:Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text("搜索", style: TextStyle(color: Colors.white),),
        )
      ),
    );
  }

  //返回底部灯导航部件
  Widget _getDots(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerlist.length, (int index){
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
              },
                child:  AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: 6,
                  width: index == _currentIndex ? 40 : 20,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: index == _currentIndex ? Colors.white : Color.fromRGBO(0, 0, 0, 0.3),
                    borderRadius: BorderRadius.circular(3)
                ),
              )
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //stack -> 轮播图 搜索框 指示灯导航
    return Stack(
      children: [_getSlider(), _getSearch(), _getDots()],
    );
    // return Container(
    //   height: 200,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text("轮播图",style: TextStyle(color: Colors.white, fontSize: 20),),
    // );
  }
}