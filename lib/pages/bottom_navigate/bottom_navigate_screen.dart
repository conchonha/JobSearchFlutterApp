import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:untitled_folder/pages/bottom_navigate/bottom_navigate_viewmodel.dart';
import 'package:provider/provider.dart';

class BottomNavigatorLayout extends StatelessWidget {
  const BottomNavigatorLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<BottomNavigatorViewModel>(
        viewmodel: BottomNavigatorViewModel(),
        child: Consumer<BottomNavigatorViewModel>(
          builder: (_, vm, child) => Scaffold(
              body: vm.list.elementAt(vm.selectIndex),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.black,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.supervisor_account), label: "Find"),
                  BottomNavigationBarItem(
                      label: "Account", icon: Icon(Icons.select_all))
                ],
                currentIndex: vm.selectIndex,
                onTap: vm.setPageIndex,
              )),
        ));
  }
}
