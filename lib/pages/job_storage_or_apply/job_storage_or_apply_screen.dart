import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/base/common_list/common_list.dart';
import 'package:flutter_library/res/dimens.dart';

import '../../component/item_job.dart';
import '../../component/profile/large_appbar.dart';
import '../../res/app_color.dart';
import '../../res/contains.dart' as Drawable;
import 'job_storage_or_appy_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

class JobStorageOrApplyScreen extends StatelessWidget {
  final JobItemType? jobItemType;
  final int? id;

  const JobStorageOrApplyScreen({this.jobItemType,this.id, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<JobStorageOrApplyViewModel>(
        onCallBack: (_, vm) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            vm.loadList(jobItemType,id);
          });
        },
        viewmodel: JobStorageOrApplyViewModel(),
        child: Consumer<JobStorageOrApplyViewModel>(
          builder: (_, vm, child) => Scaffold(
            appBar: largeAppbar(
              childLeading: IconButton(
                onPressed: vm.backScreen,
                icon: SvgPicture.asset(
                  Drawable.Drawable.ic_layer_left,
                  width: AppDP.dp_6,
                  height: AppDP.dp_11,
                  color: AppColor.whiteColor,
                ),
              ),
              title: jobItemType?.convertItemType,
            ),
            body: ListView.builder(
                itemCount: vm.listJob.length,
                itemBuilder: (_, index) => CommonListItem(
                    vm.listJob[index], vm.actionJob, ItemWidgetRecommended())),
          ),
        ));
  }
}

enum JobItemType{
  TYPE_STORAGE,
  TYPE_APPLY,
  TYPE_OTHER
}

extension JobItemTypeExt on JobItemType{
  String get convertItemType{
    switch(this){
      case JobItemType.TYPE_STORAGE:
        return "Job Save";
      case JobItemType.TYPE_APPLY:
        return "Job Apply";
      default:
        return "Job List";
    }
  }
}
