import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_library/base/base_widget_model.dart';
import 'package:flutter_library/base/common_list/common_list.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/pages/home/home_viewmodel.dart';
import 'package:untitled_folder/res/app_style.dart';

import '../../model/job.dart';
import '../item_job.dart';

class RecommendedByCareer extends BaseWidgetModel<HomeViewModel> {
  bool checkRecommendedByCareer = true;

  RecommendedByCareer(this.checkRecommendedByCareer);

  @override
  Widget build(BuildContext context, HomeViewModel widgetModel) {
    List<Job> list = checkRecommendedByCareer
        ? widgetModel.listRecommendedByCareer
        : widgetModel.listRecommendedByRegion;
    return Padding(
      padding: const EdgeInsets.only(
          top: AppDP.dp_20, left: AppDP.dp_10, right: AppDP.dp_10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            checkRecommendedByCareer
                ? "Recommended By Career"
                : "Recommended By Region",
            style: AppStyle.title,
          ),
          ...list
              .map((element) => CommonListItem<Job>(
                  element, widgetModel.actionJob, ItemWidgetRecommended()))
              .toList()
        ],
      ),
    );
  }
}


