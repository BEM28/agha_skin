import 'package:agha_skin/pages/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class about_me_ig extends StatefulWidget {
  const about_me_ig({super.key});

  @override
  State<about_me_ig> createState() => _about_me_igState();
}

class _about_me_igState extends State<about_me_ig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: Center(
              child: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const about_me(
                        url: 'https://www.instagram.com/puspajn/',
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/ig.png',
                        width: 150.w,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '@puspajn',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
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
                },
                child: SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/ig.png',
                        width: 150.w,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '@rifkaoktav',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
