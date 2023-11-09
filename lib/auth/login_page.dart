// ignore_for_file: use_build_context_synchronously

import 'package:agha_skin/auth/register_page.dart';
import 'package:agha_skin/widget/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m_toast/m_toast.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool obs = true;
  var iconObs = const Icon(Icons.remove_red_eye_rounded);
  ShowMToast toast = ShowMToast();

  Future _loginauth() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: pass.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast.errorToast(context,
            message: 'user not found',
            backgroundColor: const Color(0xFFF18F98),
            alignment: Alignment.topCenter);
      } else if (e.code == 'wrong-password') {
        toast.errorToast(context,
            message: 'Wrong password provided for that user.',
            backgroundColor: const Color(0xFFF18F98),
            alignment: Alignment.topCenter);
      } else {
        toast.errorToast(context,
            message: 'User not found.',
            backgroundColor: const Color(0xFFF18F98),
            alignment: Alignment.topCenter);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.signOut();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(130.r),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150.w,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15).w,
              width: double.infinity,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            myTextField(
              controller: email,
              obsecure: false,
              title: 'email',
              icon: Icon(
                Icons.person,
                size: 30.w,
                color: const Color(0xFF999595),
              ),
            ),
            SizedBox(height: 20.h),
            myTextField(
              controller: pass,
              obsecure: obs,
              title: 'Password',
              iconsuffix: IconButton(
                  onPressed: () {
                    if (obs) {
                      setState(() {
                        obs = false;
                        iconObs = const Icon(Icons.visibility_off_rounded);
                      });
                    } else {
                      setState(() {
                        obs = true;
                        iconObs = const Icon(Icons.visibility);
                      });
                    }
                  },
                  icon: iconObs),
              icon: Icon(
                Icons.lock,
                size: 30.w,
                color: const Color(0xFF999595),
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    void navtosignup() async {
                      final data = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const sign_up()));
                      if (data != null) {}
                    }

                    navtosignup();
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.h),
            GestureDetector(
              onTap: () {
                if (email.text == '' && pass.text == '') {
                  toast.errorToast(context,
                      message: 'form empety',
                      backgroundColor: const Color(0xFFF18F98),
                      alignment: Alignment.topCenter);
                } else {
                  _loginauth();
                }
              },
              child: Container(
                width: 350.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      )),
    );
  }
}
