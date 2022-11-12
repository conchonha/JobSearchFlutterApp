import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/base/base_widget_model.dart';
import 'package:flutter_library/res/dimens.dart';

import '../../res/app_color.dart';
import '../../res/app_style.dart';
import '../../res/contains.dart';
import '../../utils/routers.dart';
import 'package:provider/provider.dart';

import '../introduce/introduce_viewmodel.dart';

class IntroduceScreen extends StatelessWidget {
  const IntroduceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<IntroduceViewModel>(
        viewmodel: IntroduceViewModel(),
        child: Consumer<IntroduceViewModel>(
          builder: (_, vm, child) => Stack(
            children: [
              PageView(
                onPageChanged: vm.setCurrentIndex,
                children: <Widget>[
                  _IntroduceChild(
                      "Hệ thống chủ động tìm và gợi ý việc làm đến với bạn",
                      Drawable.img_danang),
                  _IntroduceChild(
                      "Tự động tìm kiếm các công việc phù hợp quang vị trí của bạn",
                      Drawable.img_danang1),
                  _IntroduceChild("Hồ sơ trực quan trong mắt nhà tuyển dụng",
                      Drawable.img_danang2),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: vm.buildIndicator(),
                ),
              )
            ],
          ),
        ));
  }
}

class _IntroduceChild extends BaseWidgetModel<IntroduceViewModel> {
  final String text;
  final String img;

  _IntroduceChild(this.text, this.img);

  @override
  Widget build(BuildContext context, widgetModel) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Image.asset(
          img,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.only(topLeft: Radius.elliptical(700, 400)),
          ),
          child: Column(
            children: [
              Container(
                width: AppDP.dp_70,
                height: AppDP.dp_70,
                margin: const EdgeInsets.only(bottom: AppDP.dp_20),
                decoration: const BoxDecoration(
                  color: AppColor.backgroundcolor,
                  borderRadius: BorderRadius.all(Radius.circular(AppDP.dp_10)),
                ),
                child: const Icon(
                  Icons.wb_incandescent,
                  color: Colors.yellow,
                  size: AppDP.dp_40,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: AppStyle.small,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
        if (widgetModel.currentIndex == 2)
          Container(
              alignment: Alignment.topRight,
              margin:
                  const EdgeInsets.only(right: AppDP.dp_20, top: AppDP.dp_20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.login_screen);
                },
                child: Text("Bỏ Qua", style: AppStyle.title),
              ))
      ],
    );
  }
}
