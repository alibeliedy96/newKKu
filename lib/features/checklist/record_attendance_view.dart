import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kku_bus/features/checklist/cubit/check_list_cubit/check_list_cubit.dart';
import 'package:kku_bus/features/checklist/cubit/check_list_cubit/check_list_state.dart';

import '../../core/widget/custom_check_box.dart';
import '../../core/widget/uti.dart';

class RecordAttendanceView extends StatefulWidget {
  const RecordAttendanceView({super.key});

  @override
  State<RecordAttendanceView> createState() => _RecordAttendanceViewState();
}

class _RecordAttendanceViewState extends State<RecordAttendanceView> {

bool isCheckedYes=false;
bool isCheckedNo=false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckListCubit.get(context).getAvailableBus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <CheckListCubit, CheckListStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var checkListCubit = CheckListCubit.get(context).availableBusData;
        if (checkListCubit.isEmpty && state is GetAvailableBusLoadState) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if (checkListCubit.isEmpty && state is GetAvailableBusSuccessState) {
          return const Center(child: Text("No data founded",style: TextStyle(
            fontSize: 30,color: Colors.black
          ),),);
        }
        if (state is GetAvailableBusErrorState) {
          return const Center(child: Text("No data founded",style: TextStyle(
              fontSize: 30,color: Colors.black
          ),),);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Bus Number', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800)),
            SizedBox(height: 5.h),
            Text("${checkListCubit[0].busNumber}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)),
            SizedBox(height: 5.h),
            const Text('City', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800)),
            SizedBox(height: 5.h),

            Text("${checkListCubit[0].city?.name}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)),
            SizedBox(height: 5.h),
            const Text('Districts', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800)),
            SizedBox(height: 5.h),
            Text("${checkListCubit[0].state?.name}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)),
            SizedBox(height: 5.h),

            const Text('Driver’s name', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800)),
            SizedBox(height: 5.h),
            Text("${checkListCubit[0].fullName}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)),
            SizedBox(height: 5.h),

            const Text('Driver’s phone', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800)),
            SizedBox(height: 5.h),
            Text("${checkListCubit[0].phoneNumber}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)), SizedBox(height: 5.h),

            const Text('Do you want to take the bus tomorrow?', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800)),
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    if(state is RecordAttendanceLoadState)
                      const Center(child: CircularProgressIndicator(),)
                    else CustomCheckbox(
                      isChecked:   isCheckedYes,
                      onChange:(isCheck){
                        isCheckedYes=isCheck;
                        isCheckedNo=false;
                        print("DateTime.now().toString()");
                        String currentDate = DateTime.now().toIso8601String().split('T')[0];

                        print(currentDate);
                         CheckListCubit.get(context).recordAttendance(driverId:

                         checkListCubit[0].id.toString(), orderDate: currentDate, context: context);
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
                    const SizedBox(width: 10,),
                    Text('Yes', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)),

                  ],
                ),
                // Row(
                //   children: [
                //     CustomCheckbox(
                //       isChecked:   isCheckedNo,
                //       onChange:(isCheck){
                //         isCheckedNo=isCheck;
                //         isCheckedYes=false;
                //         setState(() {
                //
                //         });
                //       },
                //
                //       backgroundColor:   Colors.white,
                //       borderColor:  Colors.grey ,
                //       icon: Icons.check,
                //       iconColor:  Colors.grey ,
                //       size: 30,
                //       iconSize: 25,
                //     ),
                //     const SizedBox(width: 10,),
                //     Text('No', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey.shade600)),
                //
                //   ],
                // ),
              ],
            ),

          ],
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
