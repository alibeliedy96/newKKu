import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant.dart';


class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 45.h,
      child: TabBar(padding: const EdgeInsets.all(4),physics: const BouncingScrollPhysics(),tabAlignment: TabAlignment.start,
          isScrollable: true,dividerColor: Colors.transparent,
          // physics: const NeverScrollableScrollPhysics(),
          controller:  tabController,
          indicator: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16)),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          onTap: (value) {

          },
          tabs: [Container(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),child: const Tab(text: 'Home')),
            Container(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),child: const Tab(text: 'Checklist')),
            Container(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),child: const Tab(text: 'Tracking Bus')),
            Container(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),child: const Tab(text: 'Contact')),
            Container(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),child: const Tab(text: 'User profile')),]),
    );

  }
}
