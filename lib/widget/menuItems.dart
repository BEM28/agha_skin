import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class menu_item extends StatelessWidget {
  menu_item(
      {super.key,
      required this.title,
      required this.asssetImage,
      required this.ontap});
  final String title;
  final String asssetImage;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5).w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              shape: BoxShape.circle, // This makes the container oval
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(130.r),
              child: Image.network(
                asssetImage,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
