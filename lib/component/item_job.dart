import 'package:flutter/material.dart';
import 'package:flutter_library/base/common_list/common_list.dart';
import 'package:flutter_library/res/dimens.dart';

import '../model/job/job.dart';
import '../res/app_style.dart';

class ItemWidgetRecommended extends CommonItemWidget<Job> {
  @override
  Widget typeListArrowPreview() {
    return InkWell(
      child: Container(
        height: AppDP.dp_80,
        padding: const EdgeInsets.all(AppDP.dp_5),
        margin: const EdgeInsets.only(top: AppDP.dp_5),
        decoration:
            BoxDecoration(border: Border.all(width: 0.2, color: Colors.grey)),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                commonData.icon,
                width: AppDP.dp_80,
                height: AppDP.dp_80,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppDP.dp_10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      commonData.title,
                      style: AppStyle.small?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${commonData.price}",
                      style: AppStyle.medium?.copyWith(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      commonData.description,
                      style: AppStyle.medium,
                    )
                  ],
                ),
              ),
              if (commonData.applyJob == true || commonData.saveJob == true)
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                        onTap: () {
                          iAction.onDelete(commonData);
                        },
                        child: const Icon(Icons.delete)),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
