import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/res/dimens.dart';

class IntroduceViewModel extends BaseVM{
  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  void setCurrentIndex(int? value){
    _currentIndex = value!;
    notifyListeners();
  }

  List<Widget> buildIndicator() {
    return List.generate(
        3,
            (index) => Container(
          margin: const EdgeInsets.all(AppDP.dp_2),
          decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.red : Colors.black,
            shape: BoxShape.circle,
          ),
          width: AppDP.dp_10,
          height: AppDP.dp_10,
        ));
  }

  @override
  void onInit() {
  }
}