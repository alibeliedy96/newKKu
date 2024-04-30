import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kku_bus/features/splash/welcome_screen.dart';

import '../../core/utils/cache_helper.dart';
import '../auth/login/login_view.dart';
import '../tabbar_main/tabbar_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() async {
     if(CacheHelper.getData(key: "token") ==null){
      // return  Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false,);
      return   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const WelcomeScreen()));
    }
    else{

      return   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const TabBarMain()));

    }

  }

  _startDelay() {
    Duration  delay = const Duration(milliseconds: 2000);
    if(kDebugMode) delay = const Duration(milliseconds: 2000);
    _timer = Timer(delay, () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("KKU",style: TextStyle(fontSize: 50),),
        ),
      ),
    );
  }
}
