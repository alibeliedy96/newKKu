 import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/api/data_source/end_point.dart';
import '../../../../core/api/error/error_handler/failure.dart';
import '../../../../core/api/shared/shared_methods.dart';

import '../request/register_request.dart';
import '../request/update_profile_request.dart';
import '../response/cities_response.dart';
import '../response/contact_us_response.dart';
import '../response/login_response.dart';
import '../response/resgister_response.dart';
import '../response/states_response.dart';
import '../response/update_profile.dart';



abstract class AuthRepository {
    Future<Either<Failure, LoginResponse>> login({required String email, required String password } );
    Future<Either<Failure, ContactUsResponse>> contactUs({required String email, required String subject,required String message, } );
     Future<Either<Failure, RegisterResponse>> register({required RegisterRequest registerRequest} );
     Future<Either<Failure, UpdateProfileResponse>> updateProfile({required UpdateProfileRequest updateProfileRequest} );
     Future<Either<Failure, CitiesResponse>> getAllCities(  );
     Future<Either<Failure, StatesResponse>> getAllStates({required String cityId} );



}

class AuthImplement implements AuthRepository {



  @override
  Future<Either<Failure, LoginResponse>> login({required String email, required String password  } )async {
    return await handleResponse(
      endPoint: EndPoints.login,
      asObject: (e) => LoginResponse.fromJson(e),
      method: DioMethod.post,

        data: {
        "email":email,
        "password":password,

      }


    );
  }
  @override
  Future<Either<Failure, ContactUsResponse>> contactUs({required String email, required String subject,required String message, } )async {
    return await handleResponse(
      endPoint: EndPoints.contactUs,
      asObject: (e) => ContactUsResponse.fromJson(e),
      method: DioMethod.post,

        data: {
        "email":email,
        "subject":subject,
        "message":message,

      }
      // page: page,

    );
  }

  @override
  Future<Either<Failure, RegisterResponse>> register({required RegisterRequest registerRequest} )async {

    return await handleResponse(
      endPoint: EndPoints.register,
      asObject: (e) {

        return RegisterResponse.fromJson(e);
      },
      method: DioMethod.post,

        data:registerRequest.toRequest()


    );
  }

  @override
  Future<Either<Failure, UpdateProfileResponse>> updateProfile({required UpdateProfileRequest updateProfileRequest} )async {

    return await handleResponse(
      endPoint: EndPoints.updateProfile,
      asObject: (e) {

        return UpdateProfileResponse.fromJson(e);
      },
      method: DioMethod.post,

        data:updateProfileRequest.toRequest()


    );
  }

  @override
  Future<Either<Failure, CitiesResponse>> getAllCities( )async {

    return await handleResponse(
      endPoint: EndPoints.cities,
      asObject: (e) {

        return CitiesResponse.fromJson(e);
      },
      method: DioMethod.get,



    );
  }
  @override
  Future<Either<Failure, StatesResponse>> getAllStates({required String cityId} )async {

    return await handleResponse(
      endPoint: "${EndPoints.states}$cityId",
      asObject: (e) {

        return StatesResponse.fromJson(e);
      },
      method: DioMethod.get,



    );
  }




}
