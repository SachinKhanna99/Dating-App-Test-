
import 'package:datintg_app_test/started.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  Color color = HexColor("#13235f");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: new Started(),
        //imageBackground: new Image.asset('assets/images/splashes.png'),
      //  image: Image.asset('assets/images/splashes.png'),
       // image: new Image.asset('assets/images/logoo.png',width: 100,height: 100,),
         // title: Text("Kailer",style: TextStyle(fontSize: 17,color: Colors.white),),
       // image: new Image.asset('assets/images/screen-1.png',fit: BoxFit.fill,),
      imageBackground: new AssetImage('assets/images/screen-1.png'),




        loaderColor: color,

      ),
    );
  }
}
