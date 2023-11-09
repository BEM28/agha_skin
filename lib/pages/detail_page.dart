import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class detail_page extends StatefulWidget {
  const detail_page(
      {super.key,
      required this.asssetImage,
      required this.mengatasi,
      required this.detail,
      required this.title});

  final String asssetImage;
  final String detail;
  final String title;
  final List mengatasi;

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // appbar
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                border: Border(
                    bottom: BorderSide(
                        width: 1.w,
                        color: const Color.fromARGB(173, 30, 30, 30)))),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: 80.w,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.blue,
                          size: 30.w,
                        ),
                        Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          //content
          SizedBox(height: 10.h),
          Container(
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
                widget.asssetImage,
                width: 200.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 35.h,
            child: Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            color: Colors.black87,
          ),
          Container(
            width: double.infinity,
            height: 50.h,
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle, // This makes the container oval
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.network(
                      widget.asssetImage,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  widget.title,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      widget.detail,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      width: double.infinity,
                      child: Text(
                        'Mengatasi',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    for (int i = 0; i < widget.mengatasi.length; i++) ...{
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 30.w,
                              height: 30.h,
                              child: Text(String.fromCharCode(97 + i),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ))),
                          Expanded(
                              child: Text(widget.mengatasi[i],
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ))),
                        ],
                      ),
                    },
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
