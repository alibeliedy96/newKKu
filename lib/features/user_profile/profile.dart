import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kku_bus/features/auth/data/request/update_profile_request.dart';

import '../../core/utils/cache_helper.dart';
import '../../core/widget/uti.dart';
import '../auth/cubit/auth_cubit/auth_cubit.dart';
import '../auth/cubit/auth_cubit/auth_state.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {




  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _levelAcademicController =
      TextEditingController();
  final TextEditingController _majorController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fullNameController.text = CacheHelper.getData(
      key: "name",
    );
    _emailController.text = CacheHelper.getData(
      key: "email",
    );
    _phoneController.text = CacheHelper.getData(
      key: "phone",
    );
    AuthCubit.get(context).cityId = CacheHelper.getData(
      key: "cityId",
    );
    AuthCubit.get(context).stateId = CacheHelper.getData(
      key: "stateId",
    );
    _majorController.text = CacheHelper.getData(
      key: "major",
    );
    _levelAcademicController.text = CacheHelper.getData(
      key: "levelAcademic",
    );

    AuthCubit.get(context).cities.clear();
    AuthCubit.get(context).states.clear();
    AuthCubit.get(context).getAllCities();
    if(AuthCubit.get(context).cityId !=null){
      AuthCubit.get(context).getAllStates(cityId: AuthCubit.get(context).cityId.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _levelAcademicController.dispose();
    _majorController.dispose();
  }
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey ,

        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Full Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(
                  width: 195.w,
                  child: TextFormField(
                      controller: _fullNameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Name cannot be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Full Name",
                        errorStyle: TextStyle(color: Colors.red),
                        hintStyle: TextStyle(color: Colors.grey),
                      ))),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('City',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(width: 195.w, child: buildCities()),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Neighborhood',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(width: 195.w, child: buildStates()),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Major',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(
                  width: 195.w,
                  child: TextFormField(
                      controller: _majorController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Major cannot be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Major",
                        errorStyle: TextStyle(color: Colors.red),
                        hintStyle: TextStyle(color: Colors.grey),
                      ))),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Academic\nlevel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(
                  width: 195.w,
                  child: TextFormField(
                      controller: _levelAcademicController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Academic level cannot be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Academic level",
                        errorStyle: TextStyle(color: Colors.red),
                        hintStyle: TextStyle(color: Colors.grey),
                      ))),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Phone\nNumber',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(
                  width: 195.w,
                  child: TextFormField(
                      controller: _phoneController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Phone Number cannot be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Phone Number",
                        errorStyle: TextStyle(color: Colors.red),
                        hintStyle: TextStyle(color: Colors.grey),
                      ))),
            ],
          ),
          SizedBox(height: 100.h),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is UpdateProfileLoadState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : InkWell(
                      onTap: () {
                              if (formKey.currentState!.validate()) {
                                UpdateProfileRequest updateProfileRequest =
                                UpdateProfileRequest(
                                    fullName: _fullNameController.text,
                                    cityId: AuthCubit.get(context).cityId.toString(),
                                    major: _majorController.text,
                                    stateId: AuthCubit.get(context).stateId.toString(),
                                    levelAcademic: _levelAcademicController.text,
                                    phoneNumber: _phoneController.text);
                                AuthCubit.get(context).updateProfile(
                                    context: context,
                                    updateProfileRequest: updateProfileRequest);
                              }

                      },
                      child: Center(
                          child: Image.asset(
                              'assets/images/Sign up button (2).png')));
            },
          ),
        ]),
      ),
    );
  }

  Widget buildCities() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cityCubit = AuthCubit.get(context).cities;
        if (cityCubit.isEmpty && state is LoadAllCitiesState) {
          return UTI.pleaseWait(context);
        }
        if (cityCubit.isEmpty && state is SuccessAllCitiesState) {
          return Container();
        }
        if (state is ErrorAllCitiesState) {
          return Container();
        }

        return Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: DropdownSearch(
              items: cityCubit.map((e) => e.name!).toList(),
              enabled: true,

              onChanged: (newValue) {
                AuthCubit.get(context).cityId = int.tryParse(cityCubit
                    .firstWhere((element) => element.name == newValue)
                    .id
                    .toString());
                AuthCubit.get(context).cityName = cityCubit
                    .firstWhere((element) => element.name == newValue)
                    .name;

                print("cityId");
                print(AuthCubit.get(context).cityId);
                print(AuthCubit.get(context).cityName);
                AuthCubit.get(context).states.clear();
                AuthCubit.get(context).getAllStates(cityId: AuthCubit.get(context).cityId.toString());
                setState(() {});
              },

              //show selected item
              selectedItem: AuthCubit.get(context).cityName,
            ),
          ),
        );
      },
    );
  }

  Widget buildStates() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var stateCubit = AuthCubit.get(context).states;
        if (stateCubit.isEmpty && state is LoadAllStatesState) {
          return UTI.pleaseWait(context);
        }
        if (stateCubit.isEmpty && state is SuccessAllStatesState) {
          return Container();
        }
        if (state is ErrorAllStatesState) {
          return Container();
        }

        return Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: DropdownSearch(
              items: stateCubit.map((e) => e.name!).toList(),
              enabled: true,

              onChanged: (newValue) {
                AuthCubit.get(context).stateId = int.tryParse(stateCubit
                    .firstWhere((element) => element.name == newValue)
                    .id
                    .toString());
                AuthCubit.get(context).stateName = stateCubit
                    .firstWhere((element) => element.name == newValue)
                    .name;


              },

              //show selected item
              selectedItem: AuthCubit.get(context).stateName,
            ),
          ),
        );
      },
    );
  }
}
