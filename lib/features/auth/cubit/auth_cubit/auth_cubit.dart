
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kku_bus/features/auth/data/request/update_profile_request.dart';
import 'package:kku_bus/features/auth/data/response/cities_response.dart';


import '../../../../core/utils/cache_helper.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widget/uti.dart';
import '../../../tabbar_main/tabbar_main.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/request/register_request.dart';
import '../../data/response/states_response.dart';
import '../../login/login_view.dart';
import 'auth_state.dart';


class AuthCubit extends Cubit<AuthState>  {
  AuthCubit() : super(AuthInitial()) ;

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  bool showNewPassword = true;
  int? cityId;
  String? cityName = "select city";

  int? stateId;
  String? stateName = "select state";

  toggleNewPassword(){
    showNewPassword = !showNewPassword;
    emit(ChangeIconNewPasswordState());
  }
    final AuthRepository _repo = AuthImplement();
  List<CitiesData> cities = [];
  List<StatesData> states = [];
  /// login
  Future<void> login(
  {required String email ,required String password ,required context, }
 ) async {
    emit(LoginLoadState());

    final res = await _repo.login(email:email,password:password );
    res.fold(
          (l) {


            UTI.showToast(msg:l.message,gravity: ToastGravity.CENTER);
        emit(LoginErrorState());
      },
          (r) {
            if(r.success ==true) {
              CacheHelper.saveData(key: "type",value:r.data?.type);
              CacheHelper.saveData(key: "token",value:r.data?.token);
              CacheHelper.saveData(key: "name",value:r.data?.fullName);
              CacheHelper.saveData(key: "email",value:r.data?.email);
              CacheHelper.saveData(key: "cityId",value:r.data?.cityId);
              CacheHelper.saveData(key: "stateId",value:r.data?.stateId);
              CacheHelper.saveData(key: "phone",value:r.data?.phoneNumber??"");
              CacheHelper.saveData(key: "major",value:r.data?.major??"");
              CacheHelper.saveData(key: "levelAcademic",value:r.data?.levelAcademic??"");
              UTI.showToast(msg:r.message.toString(),gravity: ToastGravity.CENTER);
              emit(LoginSuccessState());
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TabBarMain()));
            }


      },
    );
  }




  /// register
  Future<void> register(
  {required context,required RegisterRequest registerRequest}
 ) async {
    emit(RegisterLoadState());

    final res = await _repo.register( registerRequest: registerRequest);
    res.fold(
          (l) {

            UTI.showToast(msg:l.message ,gravity: ToastGravity.CENTER);
             print("error   is ${l.message}");

        emit(RegisterErrorState());
      },
          (r) {
            if(r.success ==true) {


              emit(RegisterSuccessState());
              UTI.showToast(msg:r.message.toString(),gravity: ToastGravity.CENTER);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const LoginView()));
            }



      },
    );
  }


  /// update profile
  Future<void> updateProfile(
  {required context,required UpdateProfileRequest updateProfileRequest}
 ) async {
    emit(UpdateProfileLoadState());

    final res = await _repo.updateProfile( updateProfileRequest: updateProfileRequest);
    res.fold(
          (l) {

            UTI.showToast(msg:l.message ,gravity: ToastGravity.CENTER);
             print("error   is ${l.message}");

        emit(UpdateProfileErrorState());
      },
          (r) {
            if(r.success ==true) {


              CacheHelper.saveData(key: "name",value:r.data?.fullName);
              CacheHelper.saveData(key: "email",value:r.data?.email);
              CacheHelper.saveData(key: "type",value:r.data?.type);
              CacheHelper.saveData(key: "cityId",value:r.data?.cityId);
              CacheHelper.saveData(key: "stateId",value:r.data?.stateId);
              CacheHelper.saveData(key: "phone",value:r.data?.phoneNumber??"");
              CacheHelper.saveData(key: "major",value:r.data?.major??"");
              CacheHelper.saveData(key: "levelAcademic",value:r.data?.levelAcademic??"");
              emit(UpdateProfileSuccessState());
              UTI.showToast(msg:r.message.toString(),gravity: ToastGravity.CENTER);
             }



      },
    );
  }

  /// contact us
  Future<void> contactUs(
      {required String email ,required String subject ,required String message ,required context, }
      ) async {
    emit(ContactUsLoadState());

    final res = await _repo.contactUs(email: email, subject: subject, message: message);
    res.fold(
          (l) {


        UTI.showToast(msg:l.message,gravity: ToastGravity.CENTER);
        emit(
            ContactUsErrorState());
      },
          (r) {
        if(r.success ==true) {

          UTI.showToast(msg:r.message.toString(),gravity: ToastGravity.CENTER);
          emit(ContactUsSuccessState());

        }


      },
    );
  }


  ///all cities
  Future<void> getAllCities({

    bool onLoad = false,
  }) async {
    emit(LoadAllCitiesState());

    final res = await _repo.getAllCities( );
    res.fold(
          (l) {
        // ToastManager.handelFailure(l);


        emit(ErrorAllCitiesState());
      },
          (r) {


        cities =  r.data??[];


        emit(SuccessAllCitiesState());
        cityName=cities.firstWhere((element) => element.id==CacheHelper.getData(key: "cityId", )).name;
      },
    );
  }

  ///all states
  Future<void> getAllStates({
   required String cityId
  }) async {
    emit(LoadAllStatesState());

    final res = await _repo.getAllStates(cityId: cityId );
    res.fold(
          (l) {



        emit(ErrorAllStatesState());
      },
          (r) {


        states =  r.data??[];


        emit(SuccessAllStatesState());
        stateName=states.firstWhere((element) => element.id==CacheHelper.getData(key: "stateId", )).name;
      },
    );
  }


  // ============= validations ==========
  String? validateFirstName(String? txt) => ValidatorsImp.validateName(txt);




  String? validateEmail(String? txt) => ValidatorsImp.validateEmail(txt);

  String? validatePassword(String? txt) => ValidatorsImp.validatePassword(txt);
  String? validateConfirmPassword(String? pass,cPass) => ValidatorsImp.validateConfirmPassword(pass,cPass);


}


