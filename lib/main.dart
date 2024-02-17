import 'package:flutter/material.dart';
import 'package:mod2/home.dart';
import 'package:mod2/user_prov.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context){
    return ChangeNotifierProvider.value(
      value: Userprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        title:' GITHUB',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
  }