import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kku_bus/core/widget/default_scaffold.dart';
import 'package:kku_bus/features/auth/cubit/auth_cubit/auth_state.dart';
import 'package:kku_bus/features/auth/data/request/register_request.dart';
import 'package:kku_bus/features/auth/login/login_view.dart';
import 'package:kku_bus/features/tabbar_main/tabbar_main.dart';

import '../../../core/widget/uti.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  int? cityId;
  String? cityName= "select city";

  int? stateId;
  String? stateName= "select state";

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthCubit.get(context).cities.clear();
    AuthCubit.get(context).states.clear();
    AuthCubit.get(context).getAllCities();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
  var formKeyRegister = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        child: SingleChildScrollView(
      child: Form(
        key: formKeyRegister,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          title(),
          SizedBox(height: 60.h),
          TextFormField(
              controller: _fullNameController,
              validator: (text) => AuthCubit.get(context).validateFirstName(text),
              decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.red),
                  hintText:
          'Full name',prefixIcon: Icon(CupertinoIcons.person))),
          const SizedBox(height: 15),
          buildCities(),
          const SizedBox(height: 10),
          buildStates(),
          // TextFormField(decoration: const InputDecoration(hintText: 'City',prefixIcon: Icon(Icons.location_on_outlined))),
          const SizedBox(height: 15),
          TextFormField(
              controller: _emailController,
              validator: (text) => AuthCubit.get(context).validateEmail(text),
              decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.red),
              hintText: 'Email',prefixIcon: Icon(Icons.email_outlined))),
          const SizedBox(height: 15),
          TextFormField(
              controller: _passwordController,

              validator: (text) => AuthCubit.get(context).validatePassword(text),
              decoration: const InputDecoration(hintText: 'Password',
                  errorStyle: TextStyle(color: Colors.red),
                  prefixIcon: Icon(Icons.lock_open))),
          const SizedBox(height: 15),
          TextFormField(
              controller: _confirmPasswordController,

              validator: (text) => AuthCubit.get(context).validateConfirmPassword(_passwordController.text,text),
              decoration: const InputDecoration(hintText: 'Confirm password',
                  errorStyle: TextStyle(color: Colors.red),
                  prefixIcon: Icon(Icons.lock_open))),
          SizedBox(height: 65.h),
          BlocConsumer<AuthCubit,AuthState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              return state is RegisterLoadState?const Center(child: CircularProgressIndicator(),): InkWell(onTap: (){
                if (formKeyRegister.currentState!.validate()) {
                  RegisterRequest registerRequest=RegisterRequest(fullName: _fullNameController.text,
                      cityId: cityId.toString(),
                      email: _emailController.text,
                      stateId: stateId.toString(),
                      confirmPassword: _confirmPasswordController.text,
                      password: _passwordController.text);
                  AuthCubit.get(context).register(context: context, registerRequest: registerRequest);
                }
              },child: SvgPicture.asset('assets/images/SignUpButton.svg',fit: BoxFit.cover));
            },

          ),
          SizedBox(height: 15.h),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              InkWell(onTap: (){


                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const LoginView()));


                },child: const Text(' sing In',style: TextStyle(fontWeight: FontWeight.w700))),
            ],
          )
        ],),
      ),
    ));
  }
  Padding title(){return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Row(children: [Icon(CupertinoIcons.location_solid,size: 20,color: Colors.grey.shade400,),
        SizedBox(width: 3.w),
        Text('KKU BUS',style: TextStyle(color: Colors.grey.shade400,fontSize: 18,fontWeight: FontWeight.bold))]),
      const Text('University Bus\nTracking App',style: TextStyle(color: Colors.black,fontSize: 36,fontWeight: FontWeight.bold))]),
  );}

  Widget buildCities() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cityCubit=AuthCubit.get(context).cities;
        if (cityCubit.isEmpty&&state is LoadAllCitiesState) {
          return UTI.pleaseWait(context);
        }
        if (cityCubit.isEmpty&&state is SuccessAllCitiesState) {

          return Container();
        }
        if ( state is ErrorAllCitiesState) {

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
                cityId = int.tryParse(cityCubit.firstWhere((element) => element.name == newValue).id.toString());
                cityName = cityCubit.firstWhere((element) => element.name == newValue).name;

                print("cityId");
                print(cityId);
                print(cityName);
                AuthCubit.get(context).states.clear();
                AuthCubit.get(context).getAllStates(cityId: cityId.toString());
                setState(() {

                });
              },

              //show selected item
              selectedItem: cityName,
            ),
          ),
        );
      },
    );
  }
  Widget buildStates() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var stateCubit=AuthCubit.get(context).states;
        if (stateCubit.isEmpty&&state is LoadAllStatesState) {
          return UTI.pleaseWait(context);
        }
        if (stateCubit.isEmpty&&state is SuccessAllStatesState) {

          return Container();
        }
        if ( state is ErrorAllStatesState) {

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
                stateId = int.tryParse(stateCubit.firstWhere((element) => element.name == newValue).id.toString());
                stateName = stateCubit.firstWhere((element) => element.name == newValue).name;

                print("stateId");
                print(stateId);
                print(stateName);

              },

              //show selected item
              selectedItem: stateName,
            ),
          ),
        );
      },
    );
  }
}
