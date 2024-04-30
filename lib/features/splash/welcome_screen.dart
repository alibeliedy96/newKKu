import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kku_bus/core/widget/default_scaffold.dart';
import 'package:kku_bus/features/auth/login/login_view.dart';
import 'package:kku_bus/features/auth/register/register_view.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
      title(),
      SizedBox(height: 45.h),
      Image.asset('assets/images/imageLocation.png'),
      SizedBox(height: 35.h),
      Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const LoginView()));
        },child: SvgPicture.asset('assets/images/Loginbutton.svg',fit: BoxFit.cover))),
      SizedBox(height: 15.h),
      const Text('OR',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
      SizedBox(height: 15.h),
      InkWell(onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const RegisterView()));},
          child: const Text('create account',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,decoration: TextDecoration.underline)))]));
  }
  Padding title(){return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Row(children: [Icon(CupertinoIcons.smiley,size: 20,color: Colors.grey.shade400,),
            SizedBox(width: 3.w),
            Text('KKU BUS',style: TextStyle(color: Colors.grey.shade400,fontSize: 18,fontWeight: FontWeight.bold))]),
      const Text('University Bus\nTracking App',style: TextStyle(color: Colors.black,fontSize: 36,fontWeight: FontWeight.bold))]),
  );}
}
