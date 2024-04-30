 import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/api/data_source/end_point.dart';
import '../../../../core/api/error/error_handler/failure.dart';
import '../../../../core/api/shared/shared_methods.dart';
import '../response/get_available_bus_response.dart';
import '../response/record_attendance.dart';
import '../response/registered_attendance_response.dart';




abstract class CheckListRepository {

     Future<Either<Failure, GetAvailableBusResponse>> getAvailableBus(  );
     Future<Either<Failure, GetRegisteredAttendanceResponse>> registeredAttendees(  );

     Future<Either<Failure, RecordAttendanceResponse>>  recordAttendance(
     {required String driverId ,required String orderDate ,required context, });



}

class CheckListImplement implements CheckListRepository {


  @override
  Future<Either<Failure,  RecordAttendanceResponse>>  recordAttendance(
      {required String driverId ,required String orderDate ,required context, })async {
    return await handleResponse(
        endPoint: EndPoints.recordAttendance,
        asObject: (e) => RecordAttendanceResponse.fromJson(e),
        method: DioMethod.post,

        data:{
          "driver_id" : int.tryParse(driverId) ,
          "order_date"   : orderDate
        }


    );
  }

  @override
  Future<Either<Failure, GetAvailableBusResponse>> getAvailableBus(  )async {

    return await handleResponse(
      endPoint: EndPoints.availableBus,
      asObject: (e) {

        return GetAvailableBusResponse.fromJson(e);
      },
      method: DioMethod.get,



    );
  }
  @override
  Future<Either<Failure, GetRegisteredAttendanceResponse>> registeredAttendees(  )async {

    return await handleResponse(
      endPoint: EndPoints.registeredAttendance,
      asObject: (e) {

        return GetRegisteredAttendanceResponse.fromJson(e);
      },
      method: DioMethod.get,



    );
  }


}
