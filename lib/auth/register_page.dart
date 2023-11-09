// ignore_for_file: use_build_context_synchronously

import 'package:agha_skin/auth/login_page.dart';
import 'package:agha_skin/pages/splash_page.dart';
import 'package:agha_skin/widget/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m_toast/m_toast.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  bool _acceptTerms = false;
  bool obs = true;
  bool obsre = true;
  var iconObs = const Icon(Icons.remove_red_eye_rounded);
  var iconObsre = const Icon(Icons.remove_red_eye_rounded);
  ShowMToast toast = ShowMToast();

  void _register() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      User? user = userCredential.user;
      // tembak keluar
      FirebaseAuth.instance.signOut().then((value) async {
        toast.successToast(context,
            message: 'succesfuly creating account',
            backgroundColor: const Color(0xFFA1F18F),
            alignment: Alignment.topCenter);

        await Future.delayed(const Duration(seconds: 2));
        Navigator.pop(context);
        // Navigator.pop(context);
      });
      if (userCredential.user != null) {
        // Menyimpan data pengguna ke Firestore
        await FirebaseFirestore.instance.collection('user').doc(user!.uid).set({
          'email': user.email,
          'nama': _fullNameController.text,
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        toast.errorToast(context,
            message: 'Please enter a valid email address.',
            backgroundColor: const Color(0xFFF18F98),
            alignment: Alignment.topCenter);
      } else if (e.code == 'email-already-in-use') {
        toast.errorToast(context,
            message: 'The email address is already registered.',
            backgroundColor: const Color(0xFFF18F98),
            alignment: Alignment.topCenter);
      } else if (e.code == 'weak-password') {
        toast.errorToast(context,
            message: 'Please enter a stronger password.',
            backgroundColor: const Color(0xFFF18F98),
            alignment: Alignment.topCenter);
      } else {
        toast.errorToast(context,
            message: 'An error occurred during registration.',
            backgroundColor: const Color(0xFFF18F98),
            alignment: Alignment.topCenter);
      }
    } catch (e) {
      toast.errorToast(context,
          message: 'An error occurred during registration.',
          backgroundColor: const Color(0xFFF18F98),
          alignment: Alignment.topCenter);

      // Handle registration errors (e.g., email already in use, weak password, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(130.r),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 80.w,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15).w,
              width: double.infinity,
              child: Text(
                'Creating Account',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            myTextField(
              controller: _fullNameController,
              obsecure: false,
              title: 'full name',
              icon: Icon(
                Icons.person,
                size: 30.w,
                color: const Color(0xFF999595),
              ),
            ),
            SizedBox(height: 20.h),
            myTextField(
              controller: _emailController,
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
              controller: _passwordController,
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
            SizedBox(height: 20.h),
            myTextField(
              controller: _rePasswordController,
              obsecure: obsre,
              title: 're-Password',
              iconsuffix: IconButton(
                  onPressed: () {
                    if (obsre) {
                      setState(() {
                        obsre = false;
                        iconObsre = const Icon(Icons.visibility_off_rounded);
                      });
                    } else {
                      setState(() {
                        obsre = true;
                        iconObsre = const Icon(Icons.visibility);
                      });
                    }
                  },
                  icon: iconObsre),
              icon: Icon(
                Icons.lock,
                size: 30.w,
                color: const Color(0xFF999595),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.blue,
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value!;
                    });
                  },
                ),
                const Text('Accept all terms and services'),
              ],
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                if (_fullNameController.text == '') {
                  toast.errorToast(context,
                      message: 'full name cannot empety',
                      backgroundColor: const Color(0xFFF18F98),
                      alignment: Alignment.topCenter);
                } else if (_emailController.text == '') {
                  toast.errorToast(context,
                      message: 'email cannot empety',
                      backgroundColor: const Color(0xFFF18F98),
                      alignment: Alignment.topCenter);
                } else if (_passwordController.text == '') {
                  toast.errorToast(context,
                      message: 'password cannot empety',
                      backgroundColor: const Color(0xFFF18F98),
                      alignment: Alignment.topCenter);
                } else if (_rePasswordController.text == '') {
                  toast.errorToast(context,
                      message: 'repassword cannot empety',
                      backgroundColor: const Color(0xFFF18F98),
                      alignment: Alignment.topCenter);
                } else if (_passwordController.text !=
                    _rePasswordController.text) {
                  toast.errorToast(context,
                      message: "password don't match",
                      backgroundColor: const Color(0xFFF18F98),
                      alignment: Alignment.topCenter);
                } else if (!_acceptTerms) {
                  toast.errorToast(context,
                      message: 'please check the terms and service',
                      backgroundColor: const Color(0xFFF18F98),
                      alignment: Alignment.topCenter);
                } else {
                  _register();

                  // Future.delayed(Duration(seconds: 8));
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
                    'Sign up',
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
