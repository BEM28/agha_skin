import 'package:agha_skin/auth/login_page.dart';
import 'package:agha_skin/pages/detail_page.dart';
import 'package:agha_skin/pages/splash_page.dart';
import 'package:agha_skin/widget/menuItems.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m_toast/m_toast.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredDataSkin = [];
  List<Map<String, dynamic>> dataSkin = [];
  ShowMToast toast = ShowMToast();
  final user = FirebaseAuth.instance.currentUser,
      db = FirebaseFirestore.instance;

  var name;

  Future<void> getNama() async {
    final data = await db
        .collection('user')
        .where('email', isEqualTo: user?.email)
        .get();
    var userDatas = data.docs.map((e) => e.data()).toList();
    setState(() {
      name = userDatas[0]['nama'];

      toast.successToast(context,
          message: 'Welcome Back!, $name',
          backgroundColor: const Color(0xFFA1F18F),
          alignment: Alignment.topCenter);
    });
    print(userDatas);
  }

  // memanggil data skin dari firebase
  Future<void> getDataFromFirebase() async {
    final data = await FirebaseFirestore.instance.collection('data-skin').get();
    setState(() {
      dataSkin.addAll(data.docs.map((e) => e.data()));
      filteredDataSkin.addAll(data.docs.map((e) => e.data()));
    });
  }

  @override
  void initState() {
    super.initState();
    getNama();
    getDataFromFirebase();
  }

  //fungsi untuk memfilter data dari search
  void _filterDataSkin(String query) {
    setState(() {
      // Filter the dataSkin based on the search query
      filteredDataSkin = dataSkin
          .where((item) =>
              item['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
      print(filteredDataSkin[0]['title']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 80.h,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 50).w,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return const splash_pages();
                          }), (r) {
                            return false;
                          });
                        },
                        child: Icon(
                          Icons.exit_to_app_rounded,
                          size: 30.w,
                        ),
                      ),
                    ),
                  ],
                ),
                //search bar custom
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10).w,
                    padding: const EdgeInsets.only(left: 10, right: 10).w,
                    width: double.infinity,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xFFD9D9D9)),
                    child: TextFormField(
                      controller: _searchController,
                      onChanged: _filterDataSkin,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color.fromARGB(255, 21, 21, 21),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30.w,
                          color: const Color(0xFF999595),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 17.sp,
                          color: const Color(0xFF999595),
                          fontWeight: FontWeight.w600,
                        ),
                        border: InputBorder.none,
                      ),
                    )),
              ],
            ),
          ),
          //menampilkan data
          Expanded(
            child: GridView.builder(
              itemCount: filteredDataSkin.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1),
              itemBuilder: (context, index) {
                return menu_item(
                  title: filteredDataSkin[index]['title'],
                  asssetImage: filteredDataSkin[index]['image'],
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detail_page(
                                  asssetImage: filteredDataSkin[index]['image'],
                                  detail: filteredDataSkin[index]['detail'],
                                  title: filteredDataSkin[index]['title'],
                                  mengatasi: filteredDataSkin[index]
                                      ['mengatasi'],
                                )));
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
