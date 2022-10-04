import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/component/home/career.dart';
import 'package:untitled_folder/component/home/drawable_layout.dart';
import 'package:untitled_folder/pages/home/home_viewmodel.dart';
import 'package:untitled_folder/res/app_color.dart';
import 'package:untitled_folder/res/contains.dart';

import '../../component/home/banner.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
        viewmodel: HomeViewModel(),
        child: Scaffold(
          key: _formKey,
          body: CustomScrollView(
            // laf 1 phan  cua phan tu cos the cuon
            slivers: <Widget>[
              //một thanh công cụ động mà khi chúng tôi trượt nó sẽ hiển thị nội dung
              SliverAppBar(
                backgroundColor: Colors.transparent,
                title: const Text("Job Hot"),
                centerTitle: true,
                expandedHeight: 200,
                //Thanh ứng dụng vẫn có thể mở rộng và co lại khi người dùng cuộn, nhưng nó sẽ vẫn hiển thị thay vì được cuộn ra khỏi tầm nhìn.
                pinned: true,
                // đổi lại thành false nếu muốn loại bỏ nó ra khỏi phần cuộn
                leading: IconButton(
                  onPressed: () {
                    _formKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: AppDP.dp_17,
                  ),
                ),
                flexibleSpace: const FlexibleSpaceBar(
                  background: BannerChild(),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                  CareerWidget()
                // EventChild(),
                // PlaceChild(),
                // ImageChild(),
              ]))
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawableLayout()
              ],
            ),
          ),
        ));
  }
}
