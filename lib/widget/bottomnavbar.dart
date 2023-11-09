// ignore_for_file: deprecated_member_use

import 'package:agha_skin/pages/account_page.dart';
import 'package:agha_skin/pages/home_page.dart';
import 'package:agha_skin/pages/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  String page = 'home';

  void _showAboutBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const about_me(
          url:
              'https://www.instagram.com/rifkaoktav/?igshid=NGExMmI2YTkyZg%3D%3D',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1.w, color: Colors.black87))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                page = 'home';
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const home_page()));
              });
            },
            child: Text(
              'Home',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: page == 'home' ? FontWeight.w700 : null,
                color: Colors.black87,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _showAboutBottomSheet();
              });
            },
            child: Text(
              'About',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
