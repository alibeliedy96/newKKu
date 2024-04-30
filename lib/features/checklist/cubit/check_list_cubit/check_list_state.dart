
import 'package:flutter/material.dart';

@immutable
abstract class CheckListStates {}

class CheckListInitial extends CheckListStates {}



//CheckList
class GetAvailableBusLoadState extends CheckListStates {}
class GetAvailableBusSuccessState extends CheckListStates {}
class GetAvailableBusErrorState extends CheckListStates {}

//Record Attendance
class RecordAttendanceLoadState extends CheckListStates {}
class RecordAttendanceSuccessState extends CheckListStates {}
class RecordAttendanceErrorState extends CheckListStates {}




//get all registered attendance
class GetRegisteredAttendanceLoadState extends CheckListStates {}
class GetRegisteredAttendanceSuccessState extends CheckListStates {}
class GetRegisteredAttendanceErrorState extends CheckListStates {}




