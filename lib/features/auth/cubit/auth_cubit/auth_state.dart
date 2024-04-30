
import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}



//login
class LoginLoadState extends AuthState {}
class LoginSuccessState extends AuthState {}
class LoginErrorState extends AuthState {}

//contact Us
class ContactUsLoadState extends AuthState {}
class ContactUsSuccessState extends AuthState {}
class ContactUsErrorState extends AuthState {}

//register
class RegisterLoadState extends AuthState {}
class RegisterSuccessState extends AuthState {}
class RegisterErrorState extends AuthState {}


//update profile
class UpdateProfileLoadState extends AuthState {}
class UpdateProfileSuccessState extends AuthState {}
class UpdateProfileErrorState extends AuthState {}

//cities
class LoadAllCitiesState extends AuthState {}
class ErrorAllCitiesState extends AuthState {}
class SuccessAllCitiesState extends AuthState {}

//states
class LoadAllStatesState extends AuthState {}
class ErrorAllStatesState extends AuthState {}
class SuccessAllStatesState extends AuthState {}

class ChangeIconNewPasswordState extends AuthState {}







