import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_partner/cubit/app_cubit_logics.dart';
import 'package:travel_partner/cubit/app_cubit_state.dart';
import 'package:travel_partner/cubit/app_cubits.dart';
import 'package:travel_partner/pages/detail_page.dart';
import 'package:travel_partner/pages/main_page.dart';
import 'package:travel_partner/pages/welcome_page.dart';
import 'package:travel_partner/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Partner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(create: (context) => AppCubits(data: DataServices()),
      child: AppCubitLogics(),
      )
    );
  }
}
