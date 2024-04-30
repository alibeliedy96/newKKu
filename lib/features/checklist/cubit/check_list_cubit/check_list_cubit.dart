
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kku_bus/features/checklist/data/response/get_available_bus_response.dart';
import 'package:kku_bus/features/checklist/data/response/registered_attendance_response.dart';
import '../../../../core/widget/uti.dart';
import '../../data/repository/check_list_repository.dart';
import 'check_list_state.dart';


class CheckListCubit extends Cubit<CheckListStates>  {
  CheckListCubit() : super(CheckListInitial()) ;

  static CheckListCubit get(BuildContext context) => BlocProvider.of(context);

  bool showNewPassword = true;
  int? cityId;
  String? cityName = "select city";

  int? stateId;
  String? stateName = "select state";


    final CheckListRepository _repo = CheckListImplement();
  List<AvailableBusData> availableBusData = [];
  List<RegisteredAttendanceData> registeredAttendanceData = [];

  /// record attendance
  Future<void> recordAttendance(
  {required String driverId ,required String orderDate ,required context, }
 ) async {
    emit(RecordAttendanceLoadState());

    final res = await _repo.recordAttendance(driverId: driverId, orderDate: orderDate, context: context) ;
    res.fold(
          (l) {


            UTI.showToast(msg:l.message,gravity: ToastGravity.CENTER);
        emit(RecordAttendanceErrorState());
      },
          (r) {
            if(r.success ==true) {


              UTI.showToast(msg:r.message.toString(),gravity: ToastGravity.CENTER);
              emit(RecordAttendanceSuccessState());

            }


      },
    );
  }









  ///  get Available Bus
  Future<void> getAvailableBus({

    bool onLoad = false,
  }) async {
    emit(GetAvailableBusLoadState());

    final res = await _repo.getAvailableBus( );
    res.fold(
          (l) {
        // ToastManager.handelFailure(l);


        emit(GetAvailableBusErrorState());
      },
          (r) {


        availableBusData =  r.data??[];

        emit(GetAvailableBusSuccessState());
      },
    );
  }

  ///  get all register Attendees
  Future<void> registeredAttendees({

    bool onLoad = false,
  }) async {
    emit(GetRegisteredAttendanceLoadState());

    final res = await _repo.registeredAttendees( );
    res.fold(
          (l) {
        // ToastManager.handelFailure(l);


        emit(GetRegisteredAttendanceErrorState());
      },
          (r) {


            registeredAttendanceData =  r.data??[];

        emit(GetRegisteredAttendanceSuccessState());
      },
    );
  }




}


