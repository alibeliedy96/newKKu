import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kku_bus/core/widget/default_scaffold.dart';
import 'package:kku_bus/features/auth/register/register_view.dart';
import 'package:kku_bus/features/tabbar_main/tabbar_main.dart';

import '../cubit/auth_cubit/auth_cubit.dart';
import '../cubit/auth_cubit/auth_state.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKeyLogin = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(child:
    SingleChildScrollView(
      child:Form(
        key: formKeyLogin,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
          children: [title(),
          Image.asset('assets/images/imageLocation.png',width: 350,height: 250),
          TextFormField(
              controller: _emailController,
              validator: (text) => AuthCubit.get(context).validateEmail(text),
              decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.red),
                  hintText: 'Email',prefixIcon: Icon(Icons.email_outlined))),
          const SizedBox(height: 20),
          TextFormField(
              controller: _passwordController,
              validator: (text) => AuthCubit.get(context).validatePassword(text),
              decoration: const InputDecoration(
              errorStyle: TextStyle(color: Colors.red),
                  hintText: 'Password',prefixIcon: Icon(Icons.lock_open))),
          SizedBox(height: 5.h),
          const Row(mainAxisAlignment: MainAxisAlignment.end,children: [
            Text('Forgot password?',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.black))]),
          SizedBox(height: 20.h),
            BlocConsumer<AuthCubit,AuthState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                return state is LoginLoadState?
                const Center(child: CircularProgressIndicator(),):
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(onTap: (){
                       if(formKeyLogin.currentState!.validate()){
                         AuthCubit.get(context).login(context: context,  email: _emailController.text,password: _passwordController.text);

                       }
                    },child: SvgPicture.asset('assets/images/Loginbutton.svg',fit: BoxFit.cover)));
              },

            ),

          SizedBox(height: 10.h),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [const Text('dont have an account?'),
              InkWell(onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const RegisterView()));
              },child: const Text(' sing Up',style: TextStyle(fontWeight: FontWeight.w700)))])]),
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

}
