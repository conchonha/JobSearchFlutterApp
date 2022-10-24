import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/base/common_list/common_list.dart';
import 'package:untitled_folder/component/item_job.dart';
import 'package:untitled_folder/model/job/job.dart';
import 'package:untitled_folder/res/app_color.dart';

import '../../component/find_job/drawer_job.dart';
import 'find_job_viewmodel.dart';
import 'package:provider/provider.dart';

class FindJobScreen extends StatelessWidget {
  FindJobScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<FindJobViewModel>(
        viewmodel: FindJobViewModel(),
        child: Scaffold(
          key: _formKey,
          body: Stack(
            children: <Widget>[
              Container(
                // Background
                color: AppColor.backgroundcolor,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width, // Background
                child: const Center(
                  child: Text(
                    "Search Option",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),

              Consumer<FindJobViewModel>(
                builder: (_, vm, child) =>
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.2),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.8,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: ListView(
                        children: vm.listSearch
                            .map((e) =>
                            CommonListItem<Job>(
                                e, vm.actionJob, ItemWidgetRecommended()))
                            .toList(),
                      ),
                    ),
              ), // Required some widget in between to float AppBar

              Positioned(
                // To take AppBar Size only
                top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.17,
                left: 20.0,
                right: 20.0,
                child: AppBar(
                  backgroundColor: Colors.white,
                  leading: GestureDetector(
                    onTap: () {
                      _formKey.currentState?.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: AppColor.backgroundcolor,
                    ),
                  ),
                  primary: false,
                  title: Consumer<FindJobViewModel>(builder: (_, vm, child) => TextField(
                      onChanged: vm.onTextChange,
                      decoration: const InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey))),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search,
                          color: AppColor.backgroundcolor),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          drawer: Drawer(
            child: DrawerJob(),
          ),
        )
    );
  }
}
