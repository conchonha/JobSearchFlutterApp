import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_library/base/base_widget_model.dart';
import 'package:flutter_library/base/common_list/common_list.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/model/drawer.dart';
import 'package:untitled_folder/pages/find_job/find_job_viewmodel.dart';
import 'package:untitled_folder/res/app_style.dart';

class DrawerJob extends BaseWidgetModel<FindJobViewModel> {
  @override
  Widget build(BuildContext context, FindJobViewModel widgetModel) {
    return ListView.builder(itemBuilder: (_, index) =>
        CommonListItem<DrawerData>(
            widgetModel.listDrawable[index], widgetModel.actionDrawable,
            _ItemWidgetJob()),
      itemCount: widgetModel.listDrawable.length,);
  }

}

class _ItemWidgetJob extends CommonItemWidget<DrawerData> {
  @override
  Widget typeListArrow() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: AppDP.dp_15),
        padding: const EdgeInsets.only(top: AppDP.dp_15, left: AppDP.dp_5),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 0.2, color: Colors.grey))
        ),
        child: Text(
          commonData.title, style: AppStyle.small?.copyWith(color: Colors.grey),)
    );
  }

  @override
  Widget typeListArrowPreview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDP.dp_15,vertical: AppDP.dp_10),
      child: Row(children: [
        Text(commonData.title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Icon(commonData.iconData)
      ],),
    );
  }
}
