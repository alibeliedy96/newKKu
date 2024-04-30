import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kku_bus/features/checklist/cubit/check_list_cubit/check_list_cubit.dart';

import '../../core/utils/cache_helper.dart';
import '../../core/widget/custom_check_box.dart';
import '../../core/widget/uti.dart';
import '../auth/login/login_view.dart';
import 'cubit/check_list_cubit/check_list_state.dart';

class ChecklistView extends StatefulWidget {
  const ChecklistView({super.key});

  @override
  State<ChecklistView> createState() => _ChecklistViewState();
}

class _ChecklistViewState extends State<ChecklistView> {
  List<Student> names = [
    Student('atheer Mansour hussein',true),
    Student('Hussein Alshreef',true),
    Student('Hagar Ahmed',true),
    Student('Gehad Hassan',false),
    Student('Ganna Ahmed Omr',false),
    Student('Shrouk Yousre',true),
    Student('ali Abdallah',true),
    Student('Shimma Omr',false),
    Student('Ganna Ahmed Omr',false),
    Student('Roshdi Ahmed Safwat',false),
    Student('Sarah Ahmed, Al-Eskan',true),
    Student('Linda Hasan, Al-Eskan',true),

    Student('Hanan Akram, Al-Eskan',false),
    Student('Fatima Khaled, Al-Diafa',true),
    Student('Dalia Mazen, Al-Diafa',false),
    Student('Mariam Sameh, Al-Diafa',false),
    Student('Sally Mahmoud, Al-Diafa',true),
    Student('Rawan Shady, Al-Khaldiah',false),
    Student('Atheer Mansour, Al-Khaldiah',true),
    Student('Manar Hasan, Al-Khaldiah',true),


  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckListCubit.get(context).registeredAttendees();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <CheckListCubit, CheckListStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var registeredAttendance = CheckListCubit.get(context).registeredAttendanceData;
        if (registeredAttendance.isEmpty && state is GetRegisteredAttendanceLoadState) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if (registeredAttendance.isEmpty && state is GetRegisteredAttendanceSuccessState) {
          return const Center(child: Text("No data founded",style: TextStyle(
              fontSize: 30,color: Colors.black
          ),),);
        }
        if (state is GetRegisteredAttendanceErrorState) {
          return const Center(child: Text("No data founded",style: TextStyle(
              fontSize: 30,color: Colors.black
          ),),);
        }

        return  SingleChildScrollView(
          child: Column(

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
              const Center(child: Text('Registered students will attend tomorrow',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800))),
              // const Text('Bus No. 9', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800)),
              // SizedBox(height: 10.h),
              // Text('Gaza , alskan, aldakhaila, alskan,', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)),
              // SizedBox(height: 10.h),
              // Text('Driver: Ahmed Abutreka', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)),
              SizedBox(height: 20.h),
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: registeredAttendance.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Row(
                  children: [

                    AbsorbPointer(
                      child: CustomCheckbox(
                        isChecked:  true,
                        onChange:(isCheck){
                          names[index].checked = isCheck;
                          setState(() {

                          });
                        },

                        backgroundColor:   Colors.white,
                        borderColor:  Colors.grey ,
                        icon: Icons.check,
                        iconColor:  Colors.grey ,
                        size: 30,
                        iconSize: 25,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      registeredAttendance[index].user?.fullName??"",
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },

    );
  }
}

class Student {
  String name;
  bool checked;
  Student(this.name,this.checked);
}
