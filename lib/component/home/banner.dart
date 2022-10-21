import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/res/contains.dart';

class BannerChild extends StatefulWidget {
  const BannerChild({Key? key}) : super(key: key);

  @override
  _BannerChildState createState() => _BannerChildState();
}

class _BannerChildState extends State<BannerChild> {
  final PageController _pageViewController = PageController();
  int _currentItem = 0;
  final _listUrl = [
    'https://sites.google.com/site/dulichdanang365/_/rsrc/1560331354632/bai-bien-da-nang/bai-bien-my-khe-da-nang/Bai-Bien-My-Khe2.jpg',
    'https://mytourcdn.com/upload_images/Image/Tuan%20NL/dong%20Huyen%20Khong/7220018876_0759c14c4e_z.jpg',
    'https://danangsensetravel.com/view/at_kham-pha-dong-am-phu-da-nang_221bb899e8d81652a38e159720ac4313.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSb6RZ_uDhHgni8SbTTeHcqp_xco03ofFjHpwdZO9ihYZKREl9l&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRG7uSaTUMrA6obW0I3DSLkWI-IuQBoyF86CpJRC1uUNTV0E8Bw&usqp=CAU',
    'https://cdn.yeudulich.com/940x630/media/attraction/attraction/VNMDAD16.jpg'
  ];

  @override
  void initState() {
    _animateSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageViewController,
          children: _listUrl.map((String url) {
            return Image.asset(
              Drawable.img_danang1,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            );
          }).toList(),
        ),
        Positioned(
          bottom: 2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIndicator() {
    return _listUrl.map((String url) {
      bool isSelected = _listUrl.indexOf(url) == _currentItem;
      return Container(
        margin: const EdgeInsets.all(AppDP.dp_2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.black,
          shape: BoxShape.circle,
        ),
        width: AppDP.dp_10,
        height: AppDP.dp_10,
      );
    }).toList();
  }

  void _animateSlider() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (_pageViewController.page == null) return;
      setState(() {
        _currentItem = _pageViewController.page!.round() + 1;
      });

      if (_currentItem == _listUrl.length) {
        _currentItem = 0;
      }

      _pageViewController
          .animateToPage(_currentItem,
              duration: const Duration(microseconds: 350),
              curve: Curves.easeInOutCirc)
          .then((_) => _animateSlider());
    });
  }
}
