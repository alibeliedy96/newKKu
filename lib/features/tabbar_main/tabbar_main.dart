import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kku_bus/core/utils/cache_helper.dart';
import 'package:kku_bus/core/widget/uti.dart';
import 'package:kku_bus/features/auth/login/login_view.dart';
import 'package:kku_bus/features/checklist/checklist_driver_view.dart';
import 'package:kku_bus/features/checklist/record_attendance_view.dart';
import 'package:kku_bus/features/contact/contact_view.dart';
import 'package:kku_bus/features/home/home_view.dart';
import 'package:kku_bus/features/tabbar_main/custom_tabbar.dart';
import 'package:kku_bus/features/tabbar_main/tab_cubit/tab_cubit.dart';
import 'package:kku_bus/features/tabbar_main/tab_cubit/tab_state.dart';
import 'package:kku_bus/features/tracking_bus/tracking_bus.dart';
import 'package:kku_bus/features/user_profile/profile.dart';

import '../../core/constant.dart';

class TabBarMain extends StatefulWidget {
  const TabBarMain({super.key});

  @override
  State<TabBarMain> createState() => _TabBarMainState();
}

class _TabBarMainState extends State<TabBarMain>
    with SingleTickerProviderStateMixin {
  _handleTabSelection() {
    if (tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(_handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TabCubit, TabState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
            child: CacheHelper.getData(key: "type",)=="driver" ?
        const ChecklistView():
            Column(
              children: [

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Hi, ${CacheHelper.getData(key: "name")}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800)),
                      InkWell(
                        onTap: () {
                          CacheHelper.removeData(key: "token");
                          UTI.navigateTo(context, const LoginView());
                        },
                        child: Container(
                            width: 35.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffFFE8Ec)),
                            child: Image.asset('assets/images/logout.png')),
                      )
                    ]),
                SizedBox(height: 15.h),
                Expanded(
                  child: Column(children: [
                    const CustomTabBar(),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Center(
                        child: [
                          const HomeView(),

                          const RecordAttendanceView(),

                          const TrackingBusView(),
                          const ContactView(),
                          const UserProfile()
                        ][tabController.index],
                      ),
                    ),
                    // const Expanded(flex: 5, child: TabBarView(
                    //
                    //     children: [
                    //   HomeView(),ChecklistView(),TrackingBusView(),ContactView(),UserProfile()]))
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
