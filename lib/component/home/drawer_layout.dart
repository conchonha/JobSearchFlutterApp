import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget_model.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/pages/home/home_viewmodel.dart';
import 'package:flutter_library/base/common_list/common_list.dart';

import '../../model/drawer.dart';
import '../../res/app_color.dart';
import '../../res/app_style.dart';
import '../../res/contains.dart';

class DrawerLayout extends BaseWidgetModel<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel widgetModel) {
    return Column(
      children: <Widget>[
        Container(
          color: AppColor.backgroundcolor,
          height: AppDP.dp_150,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: AppDP.dp_10, bottom: AppDP.dp_10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(AppDP.dp_35)),
                      child: Image.asset(
                        Drawable.img_danang,
                        width: AppDP.dp_60,
                        height: AppDP.dp_60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: AppDP.dp_10,
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Sang Thai Ba",
                            style:
                                AppStyle.small?.copyWith(color: Colors.white),
                          ),
                          Text(
                            "thaibasang8@gmail.com",
                            style:
                                AppStyle.medium?.copyWith(color: Colors.grey),
                            textAlign: TextAlign.start,
                          )
                        ])
                  ],
                ),
              )
            ],
          ),
        ),
        ...widgetModel.listDrawable
            .map((e) => CommonListItem<DrawerData>(
                e, widgetModel.actionDrawable, _ItemWidget()))
            .toList()
      ],
    );
  }
}

class _ItemWidget extends CommonItemWidget<DrawerData> {
  @override
  Widget typeListArrowPreview() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(left: AppDP.dp_10),
        height: AppDP.dp_40,
        decoration: const BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(color: Colors.grey, width: 0.1))),
        child: Center(
          child: Row(
            children: [
               Icon(
                commonData.iconData,
                size: AppDP.dp_20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppDP.dp_15,
                ),
                child: Text(
                  commonData.title,
                  style: AppStyle.small,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
