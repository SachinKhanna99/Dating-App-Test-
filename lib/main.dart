import 'package:datintg_app_test/Screens/UserDetailScreen/UserDetailsInterests.dart';
import 'package:datintg_app_test/Screens/UserDetailScreen/UserFacebook.dart';
import 'package:datintg_app_test/phoneauth.dart';
import 'package:flutter/material.dart';

import 'SplashScreen.dart';

void main() {

   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Splash(),
      routes: {
        '/fb':(context)=>new UserFacebook(""),

      },
    );
  }
}


