
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tab_state.dart';


class TabCubit extends Cubit<TabState>  {
  TabCubit() : super(TabInitial()) ;

  static TabCubit get(BuildContext context) => BlocProvider.of(context);


  changeTab(){

    emit(ChangeTabState());
  }






}


