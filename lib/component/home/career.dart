import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget_model.dart';
import 'package:flutter_library/base/common_list/common_list.dart';
import 'package:untitled_folder/pages/home/home_viewmodel.dart';
import 'package:untitled_folder/res/app_color.dart';
import 'package:untitled_folder/res/app_style.dart';

import '../../model/career/career.dart';

class CareerWidget extends BaseWidgetModel<HomeViewModel>{
  @override
  Widget build(BuildContext context, HomeViewModel widgetModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: Text(
            "Career",
            style: AppStyle.title,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: GridView.builder(
            //scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              //khong cho phep nguoi dung cuon
              shrinkWrap: true,
              //chỉ chiếm không gian cần thiết (nó vẫn sẽ cuộn khi có nhiều vật phẩm hơn).
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //tính toán bố cục cho các ô trong lưới
                crossAxisCount: 3, //so luong cot
                crossAxisSpacing: 10, //khoang cach giua cac cot
                mainAxisSpacing: 10, //khoang cach giua cac hang
              ),
              itemCount: widgetModel.listCareer.length,
              itemBuilder: (context, int index) => CommonListItem<Career>(widgetModel.listCareer[index], widgetModel.actionCareer, _ItemWidget())),
        ),
      ],
    );
  }
}

class _ItemWidget extends CommonItemWidget<Career>{
  @override
  Widget typeListArrowPreview() {
   return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: MaterialButton(
        elevation: 5,
        onPressed: () {
        },
        color: AppColor.backgroundcolor,
        splashColor: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
             commonData.icon,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
               commonData.title,
                style: AppStyle.small?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}