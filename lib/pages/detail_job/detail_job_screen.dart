import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/base/base_widget_model.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/model/job/job.dart';
import 'package:untitled_folder/pages/detail_job/detail_job_viewmodel.dart';
import 'package:untitled_folder/res/app_style.dart';

import '../../component/profile/large_appbar.dart';
import '../../res/app_color.dart';
import '../../res/contains.dart' as Drawable;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DetailJobScreen extends StatelessWidget {
  final Job job;

  const DetailJobScreen(this.job, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DetailJobViewModel>(
        onCallBack: (_, vm) {
          vm.setJob(job);
        },
        viewmodel: DetailJobViewModel(),
        child:  Scaffold(
          appBar: largeAppbar(
            childLeading: Consumer<DetailJobViewModel>(builder: (_,vm,child) => IconButton(
                onPressed: vm.backScreen,
                icon: SvgPicture.asset(
                  Drawable.Drawable.ic_layer_left,
                  width: AppDP.dp_6,
                  height: AppDP.dp_11,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
            title: "Detail Job",
          ),
          body: SingleChildScrollView(child: _ContentWidget()),
        ));
  }
}

class _ContentWidget extends BaseWidgetModel<DetailJobViewModel> {
  @override
  Widget build(BuildContext context, DetailJobViewModel widgetModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(top: AppDP.dp_50, left: AppDP.dp_20),
              width: AppDP.dp_100,
              height: AppDP.dp_100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppDP.dp_3)),
                color: AppColor.backgroundcolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    width: AppDP.dp_50,
                    height: AppDP.dp_50,
                    widgetModel.job.icon,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: AppDP.dp_5,
                  ),
                  Text(
                    widgetModel.job.title,
                    style: AppStyle.small?.copyWith(color: AppColor.whiteColor),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: AppDP.dp_10, left: AppDP.dp_20, right: AppDP.dp_20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Information Job",
                      textAlign: TextAlign.center,
                      style:
                          AppStyle.title?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...widgetModel.listItemStart
                      .map((e) =>
                          textItem(e.keys.first, e.values.first.toString()))
                      .toList()
                ],
              ),
            ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppDP.dp_5),
          child: Row(
            children: [
              IconButton(
                onPressed: widgetModel.saveJobLocal,
                icon: const Icon(Icons.save),
                padding: EdgeInsets.zero,
              ),
              IconButton(
                onPressed: widgetModel.saveJobApply,
                icon: const Icon(Icons.add),
                padding: EdgeInsets.zero,
              )
            ],
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.only(left: AppDP.dp_20, bottom: AppDP.dp_10),
            child: Text(
              "Other Information: ",
              style: AppStyle.small?.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppDP.dp_10),
          margin: const EdgeInsets.symmetric(horizontal: AppDP.dp_20),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.blackColor),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppDP.dp_4))),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widgetModel.listItemEnd
                      .map((e) =>
                          textItem(e.keys.first, e.values.first.toString()))
                      .toList()
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget textItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDP.dp_5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:    ",
            style: AppStyle.small?.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppDP.dp_2),
            child: Text(
              content,
              style: AppStyle.medium,
            ),
          )
        ],
      ),
    );
  }
}
