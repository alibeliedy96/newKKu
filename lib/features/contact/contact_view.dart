import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../auth/cubit/auth_cubit/auth_cubit.dart';
import '../auth/cubit/auth_cubit/auth_state.dart';
class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  var formKey  = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          const Text('Email'),
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Email cannot be empty";
              }
              return null;
            },
            decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.red),
                filled: true,fillColor: Color(0xffFFE3D3)),),
          SizedBox(height: 20.h,),
          const Text('Subject'),
          TextFormField(
            controller: _subjectController,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Subject cannot be empty";
              }
              return null;
            },
            decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.red),
                filled: true,fillColor: Color(0xffFFE3D3)),),
          SizedBox(height: 20.h,),
          const Text('Message'),
          TextFormField(
            controller: _messageController,

            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "message cannot be empty";
              }
              return null;
            },
            decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.red),
                filled: true,fillColor: Color(0xffFFE3D3)),maxLines: 5,),
          SizedBox(height: 160.h,),


          BlocConsumer<AuthCubit,AuthState>(
            listener: (context, state) {
           if(state is ContactUsSuccessState){
             _emailController.clear();
             _subjectController.clear();
             _messageController.clear();
           }
            },
            builder: (context, state) {
              return state is ContactUsLoadState?
              const Center(child: CircularProgressIndicator(),):
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(onTap: (){
                    if(formKey.currentState!.validate()){
                      AuthCubit.get(context).contactUs(email: _emailController.text,
                          subject: _subjectController.text, message: _messageController.text, context: context);

                    }
                  },child:    Center(child: Image.asset('assets/images/sendMessage.png'))));
            },

          ),

        ],),
      ),
    );
  }
}
