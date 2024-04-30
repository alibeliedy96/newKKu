import 'package:flutter/material.dart';
class DefaultScaffold extends StatefulWidget {
   DefaultScaffold({super.key,required this.child});
  Widget child;
  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          color: Colors.white,image: DecorationImage(image: AssetImage('assets/images/Background.png'),fit: BoxFit.cover,)
      ),child: Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 75,bottom: 10),child: widget.child)),);
  }
}
