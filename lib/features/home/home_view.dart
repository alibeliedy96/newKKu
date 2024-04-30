import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kku_bus/core/constant.dart';

import '../tabbar_main/tab_cubit/tab_cubit.dart';
import '../tabbar_main/tabbar_main.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              tabController.index=1;
              TabCubit.get(context).changeTab();

            },
            child: Container(height: 180.h,width:MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xffFFE3D3)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    const Center(child: Text('View Bus Checklist',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700))),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8),decoration:
                    BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                    height: 24.h,width: 110.h,child: const Center(child: Text('Saturday, oct 7',style: TextStyle(color: Colors.black))))
                  ],),
                  SizedBox(height: 10.h),
                  Image.asset('assets/images/Image Container.png')]))),
          ),
          SizedBox(height: 10.h),
          SizedBox(height: MediaQuery.of(context).size.height.h,
            child: Row(children: [
              Column(
                children: [
                  Container(width: 155.w,height: 174.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffE7F6FF)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        const Text('Bus is Coming',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                        const SizedBox(height: 10,),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                            height: 24.h,
                            width: 80.h,
                            child: const Center(child: Text('3h, 43min',style: TextStyle(color: Colors.black)))),
                        // SizedBox(height: 5.h),
                        Image.asset('assets/images/Image Container (1).png',height: 95,)
                      ],),
                    ),),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: () {
                      tabController.index=3;
                      TabCubit.get(context).changeTab();

                    },
                    child: Container(width: 155.w,height: 250.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffFFFACA)),child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        const Text('Contact\nTransportation\nunit',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                        const SizedBox(height: 10,),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                            height: 24.h,width: 80.h,child: const Center(child: Text('Send mail',style: TextStyle(color: Colors.black)))),
                        SizedBox(height: 10.h),
                        Image.asset('assets/images/Image Container (3).png',)
                      ],),
                    ),),
                  ),


                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      tabController.index=2;
                      TabCubit.get(context).changeTab();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const TabBarMain()));
                    },
                    child: Container(width: 155.w,height: 250.h,decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffFFE8Ec)),child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        const Text('Tracking Bus',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                        const SizedBox(height: 10,),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                            height: 24.h,width: 80.h,child: const Center(child: Text('view map',style: TextStyle(color: Colors.black)))),
                        // SizedBox(height: 5.h),
                        Image.asset('assets/images/Image Container (2).png',height: 170,)
                      ],),
                    ),),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: () {
                      tabController.index=4;
                      TabCubit.get(context).changeTab();

                    },
                    child: Container(width: 155.w,height: 250.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffEEE5FF)),child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        const Text('View Personal\nInfo',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18)),
                        const SizedBox(height: 10,),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                            height: 24.h,width: 80.h,child: const Center(child: Text('user profile',style: TextStyle(color: Colors.black)))),
                        SizedBox(height: 10.h),
                        Image.asset('assets/images/tree.png',)
                      ],),
                    ),),
                  ),
                ],
              ),

              // Positioned(left: 0,
              //   child: Container(width: 155.w,height: 174.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
              //       color: const Color(0xffE7F6FF)),
              //     child: Padding(
              //         padding: const EdgeInsets.all(12),
              //         child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              //           const Text('Bus is Coming',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
              //                         const SizedBox(height: 10,),
              //                         Container(padding: const EdgeInsets.symmetric(horizontal: 5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
              //           height: 24.h,child: const Text('3h, 43min',style: TextStyle(color: Colors.black))),
              //           // SizedBox(height: 5.h),
              //           Image.asset('assets/images/Image Container (1).png',height: 95,)
              //                       ],),
              //       ),),
              // ),
              // Positioned(right: 0,
              //   child: Container(width: 155.w,height: 250.h,decoration:
              //   BoxDecoration(borderRadius: BorderRadius.circular(12),
              //       color: const Color(0xffFFE8Ec)),child: Padding(
              //     padding: const EdgeInsets.all(12),
              //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              //       const Text('Tracking Bus',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
              //       const SizedBox(height: 10,),
              //       Container(padding: const EdgeInsets.symmetric(horizontal: 5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
              //           height: 24.h,child: const Text('view map',style: TextStyle(color: Colors.black))),
              //       // SizedBox(height: 5.h),
              //       Image.asset('assets/images/Image Container (2).png',height: 170,)
              //     ],),
              //   ),),
              // ),
              // Positioned(left: 0,top: 190,
              //   child: Container(width: 155.w,height: 250.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
              //       color: const Color(0xffFFFACA)),child: Padding(
              //     padding: const EdgeInsets.all(12),
              //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              //       const Text('Contact\nTransprtaion\nunit',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
              //       const SizedBox(height: 10,),
              //       Container(padding: const EdgeInsets.symmetric(horizontal: 5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
              //           height: 24.h,child: const Text('Send mail',style: TextStyle(color: Colors.black))),
              //       SizedBox(height: 10.h),
              //       Image.asset('assets/images/Image Container (3).png',)
              //     ],),
              //   ),),
              // ),
              // Positioned(right: 0,top: 270,
              //   child: Container(width: 155.w,height: 250.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
              //       color: const Color(0xffEEE5FF)),child: Padding(
              //     padding: const EdgeInsets.all(12),
              //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              //       const Text('View Personal\nInfo',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18)),
              //       const SizedBox(height: 10,),
              //       Container(padding: const EdgeInsets.symmetric(horizontal: 5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
              //           height: 24.h,child: const Text('user profile',style: TextStyle(color: Colors.black))),
              //       SizedBox(height: 10.h),
              //       Image.asset('assets/images/Image Container (3).png',)
              //     ],),
              //   ),),
              // )
            ],),
          )
        ],
      ),
    );
  }
}
