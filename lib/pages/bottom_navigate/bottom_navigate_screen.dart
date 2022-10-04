import 'package:flutter/material.dart';
import 'package:untitled_folder/pages/find_job/find_job_screen.dart';
import 'package:untitled_folder/pages/home/home_screen.dart';
import 'package:untitled_folder/pages/setting/setting_screen.dart';

class BottomNavigatorLayout extends StatefulWidget {
  const BottomNavigatorLayout({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorLayout> {
  final list = [
    HomeScreen(),
    const FindJobScreen(),
    const SettingScreen(),
  ];
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:list.elementAt(_selectIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account),
                label: "Find"
            ),
            BottomNavigationBarItem(
                label: "Setting",
                icon: Icon(Icons.select_all)
            )
          ],
          currentIndex: _selectIndex,
          onTap: (int index) {
            setState(() {
              _selectIndex = index;
            });
          },
        ));
  }
}
