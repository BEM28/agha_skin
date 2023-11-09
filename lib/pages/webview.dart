import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class about_me extends StatefulWidget {
  const about_me({super.key, required this.url});

  final String url;

  @override
  State<about_me> createState() => _about_meState();
}

class _about_meState extends State<about_me> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 600.h),
      child: SafeArea(
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
                SizedBox(width: 55.w),
                Text(
                  'Your Account',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.url),
                headers: {
                  // Custom user-agent to mimic a mobile browser
                  'User-Agent':
                      'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 123.0.0.26.116 (iPhone11,6; iOS 13_2_3; en_US; en-US; scale=3.00; 1125x2436; 184834216)',
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
