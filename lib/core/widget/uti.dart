
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kku_bus/core/utils/media_query_values.dart';


class UTI{
  UTI._();
  static Size? size;
  static Widget backIcon()=>const Icon(Icons.arrow_back_ios);









  static Future showToast ({required String msg , bool? toastState,ToastGravity gravity = ToastGravity.BOTTOM})
  {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 5,
      textColor: Colors.white,
      fontSize: 16.0,
      backgroundColor: toastState != null
          ? toastState ?Colors.yellow[900]
          : Colors.red : Colors.green,
    );
  }

  static Widget dataEmptyWidget({required String noData, required String imageName,double? width,double? height}) => Center(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 35,),
          Center(child: SvgPicture.asset(imageName, fit: BoxFit.cover,width: width,height: height,)),
          const SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              noData,
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    ),
  );

 static String? isAvailable;
 static String? fcmToken;

  static void navigateAndFinish(context, widget) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.fastOutSlowIn;

            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          }
      ),
          (route) => false,
    );
  }
  static  void navigateTo(context, widget) {
    Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.fastOutSlowIn;

            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          }
      ),
    );
  }

  static Future<Object?> showMaterialPage(BuildContext context,
      {required Widget child}) {
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.white,
            child: child,
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }


  static Container pleaseWait(BuildContext context,{double? height}) {
    return Container(
      height:height?? context.height * .06,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Color(0xff909090).withOpacity(.5),
            width: 1,
          )),
      child: Text("please wait",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
    );
  }

}
