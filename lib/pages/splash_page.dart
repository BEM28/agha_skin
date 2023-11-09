import 'package:agha_skin/auth/login_page.dart';
import 'package:agha_skin/pages/home_page.dart';
import 'package:agha_skin/pages/mainPages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m_toast/m_toast.dart';

class splash_pages extends StatefulWidget {
  const splash_pages({super.key});

  @override
  State<splash_pages> createState() => _splash_pagesState();
}

class _splash_pagesState extends State<splash_pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/cover.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150.h),
                Text(
                  'AGHASKIN',
                  style: TextStyle(
                    fontSize: 65.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0XFFFFDD66),
                    shadows: const [
                      Shadow(
                        blurRadius: 5.0,
                        color: Color.fromARGB(97, 0, 0, 0),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    'Health Skin Solution',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0XFFFFDD66),
                      shadows: const [
                        Shadow(
                          blurRadius: 5.0,
                          color: Color.fromARGB(59, 0, 0, 0),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StreamBuilder<User?>(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return const main_pages();
                            } else {
                              return const login_page();
                            }
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 200.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        'VISIT',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}
