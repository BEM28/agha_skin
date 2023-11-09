import 'package:agha_skin/pages/account_page.dart';
import 'package:agha_skin/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class main_pages extends StatefulWidget {
  const main_pages({super.key});

  @override
  State<main_pages> createState() => _main_pagesState();
}

class _main_pagesState extends State<main_pages> {
  String page = 'home';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          home_page(),
          about_me_ig(),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1.w, color: Colors.black87))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _onItemTapped(0);
              },
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: _selectedIndex == 0 ? FontWeight.w700 : null,
                  color: Colors.black87,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _onItemTapped(1);
              },
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: _selectedIndex == 1 ? FontWeight.w700 : null,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
