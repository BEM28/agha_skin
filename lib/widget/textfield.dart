import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class myTextField extends StatelessWidget {
  myTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.obsecure,
      required this.icon,
      this.iconsuffix});

  TextEditingController controller;
  final String title;
  final Icon icon;
  final IconButton? iconsuffix;
  final bool obsecure;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10).w,
        padding: const EdgeInsets.only(left: 10, right: 10).w,
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(width: 2.w, color: Colors.black87)),
        child: TextFormField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(
            fontSize: 17.sp,
            color: const Color.fromARGB(255, 21, 21, 21),
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            suffixIcon: iconsuffix,
            prefixIcon: icon,
            hintText: title,
            hintStyle: TextStyle(
              fontSize: 17.sp,
              color: const Color(0xFF999595),
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
          ),
        ));
  }
}
